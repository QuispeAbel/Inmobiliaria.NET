using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using SocialMedia.Infrastructure.Repositories;
using SocialMedia.Core.Interfaces;
using System.Threading.Tasks;
using SocialMedia.Core.Entities;
using System.Linq;
using SocialMedia.Core.DTOs;
using AutoMapper;
using System.Collections.Generic;
using SocialMedia.Api.Responses;

namespace SocialMedia.Api.Controllers
{
  [Route("api/[controller]")]
  [ApiController]
  public class PostController : ControllerBase
  {
    private readonly IPostService _postService;
    private readonly IMapper _mapper;

    public PostController(IPostService postRepository, IMapper mapper)
    {
      _postService = postRepository;
      _mapper = mapper;
    }

    [HttpGet]

    public IActionResult GetPosts()
    {
      var posts = _postService.GetPosts();

      /*var postsDto = posts.Select(x => new PostDto
      {
        PostId = x.PostId,
        UserId = x.UserId,
        Date = x.Date,
        Description = x.Description,
        Image = x.Image,
      });*/

      var postsDto = _mapper.Map<IEnumerable<PostDto>>(posts);

      var response = new ApiResponse<IEnumerable<PostDto>>(postsDto);

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
