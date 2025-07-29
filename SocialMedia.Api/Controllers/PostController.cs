using AutoMapper;
using Microsoft.AspNetCore.Mvc;
using SocialMedia.Api.Responses;
using SocialMedia.Core.CustomEntities;
using SocialMedia.Core.DTOs;
using SocialMedia.Core.Entities;
using SocialMedia.Core.Interfaces;
using SocialMedia.Core.QueryFilters;
using SocialMedia.Infrastructure.Interfaces;
using System;
using System.Collections.Generic;
using System.Net;
using System.Threading.Tasks;

namespace SocialMedia.Api.Controllers
{
  [Produces("application/json")]
  [Route("api/[controller]")]
  [ApiController]
  public class PostController : ControllerBase
  {
    private readonly IPostService _postService;
    private readonly IMapper _mapper;
    private readonly IUriService _uriService;

    public PostController(IPostService postRepository, IMapper mapper, IUriService uriService)
    {
      _postService = postRepository;
      _mapper = mapper;
      _uriService = uriService;
    }

    /// <summary>
    /// Retrive all posts
    /// </summary>
    /// <param name="filters">Filters to apply</param>
    /// <returns></returns>
    [HttpGet (Name = nameof(GetPosts))]
    [ProducesResponseType((int)HttpStatusCode.OK,Type = typeof(ApiResponse<IEnumerable<PostDto>>))]
    [ProducesResponseType((int)HttpStatusCode.BadRequest)]
    //el decorado del parametro es para que tome los valores de los parametros de la URL
    //ya que ApiController toma los objetos complejos desde el body
    public IActionResult GetPosts([FromQuery]PostQueryFilter filters)
    {
      var posts = _postService.GetPosts(filters);

      /*var postsDto = posts.Select(x => new PostDto
      {
        PostId = x.PostId,
        UserId = x.UserId,
        Date = x.Date,
        Description = x.Description,
        Image = x.Image,
      });*/

      var postsDto = _mapper.Map<IEnumerable<PostDto>>(posts);

      var metadata = new Metadata { 
        TotalCount = posts.TotalCount,
        PageSize = posts.PageSize,
        CurrentPage = posts.CurrentPage,
        TotalPages = posts.TotalPages,
        HasNextPage = posts.HasNextPage,
        HasPreviousPage = posts.HasPreviousPage,
        NextPageUrl = _uriService.GetPostPaginationUri(filters,Url.RouteUrl(nameof(GetPosts))).ToString(),
        PreviousPageUrl = _uriService.GetPostPaginationUri(filters, Url.RouteUrl(nameof(GetPosts))).ToString()

      };

      var response = new ApiResponse<IEnumerable<PostDto>>(postsDto)
      {
        Meta = metadata
      };
      //Response.Headers.Add("X-Pagination", JsonConvert.SerializeObject(metadata));
      return Ok(response); 
    }

    [HttpGet("{id}")]

    public async Task<IActionResult> GetPost(int id)
    {
      var post = await _postService.GetPost(id);

      /*var postDto = new PostDto
      {
        PostId = post.PostId,
        UserId = post.UserId,
        Date = post.Date,
        Description = post.Description,
        Image = post.Image,
      };*/

      var postDto = _mapper.Map<PostDto>(post);

      var response = new ApiResponse<PostDto>(postDto);

      return Ok(response);
    }

    [HttpPost]

    public async Task<IActionResult> Post(PostDto postDto)
    {

      /*var post = new Post {
        UserId = postDto.UserId,
        Date= postDto.Date,
        Description= postDto.Description,
        Image= postDto.Image,
      };*/
      var post = _mapper.Map<Post>(postDto);

      await _postService.InsertPost(post);

      postDto = _mapper.Map<PostDto>(post);

      var response = new ApiResponse<PostDto>(postDto);

      return Ok(response);
    }

    [HttpPut]

    public async Task<IActionResult> Put(PostDto postDto, int id)
    {
      var post = _mapper.Map<Post>(postDto);
      post.Id = id;

      var result = await _postService.UpdatePost(post);

      return Ok(post);
    }

    [HttpDelete("{id}")]

    public async Task<IActionResult> Delete(int id)
    {
      var result = await _postService.DeletePost(id);

      var response = new ApiResponse<bool>(result);

      return Ok(response);

    }

  }
}
