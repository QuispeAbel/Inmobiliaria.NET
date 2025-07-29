using SocialMedia.Core.Entities;
using SocialMedia.Core.Exeptions;
using SocialMedia.Core.Interfaces;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System;
using SocialMedia.Core.QueryFilters;
using SocialMedia.Core.CustomEntities;
using Microsoft.Extensions.Options;

namespace SocialMedia.Core.Services
{
  public class PostService : IPostService
  {
    private readonly PaginationOptions _paginationOptions;
    private readonly IUnitOfWork _unitOfWork;
    //private readonly IRepository<Post> _postRepository;
    //private readonly IRepository<User> _userRepository;

    public PostService( IUnitOfWork unitOfWork, IOptions<PaginationOptions> options)
    {
      _unitOfWork = unitOfWork;
      _paginationOptions = options.Value;
    }

    public async Task<bool> DeletePost(int id)
    {
      await _unitOfWork.PostRepository.Delete(id);
      _unitOfWork.SaveChanges();
      return true;
    }

    public async Task<Post> GetPost(int id)
    {
      return await _unitOfWork.PostRepository.GetById(id);
    }

    public PagedList<Post> GetPosts(PostQueryFilter filters)
    {
      //uso de valores por defecto 
      filters.PageNumber = filters.PageNumber == 0 ? _paginationOptions.DefaultPageNumber : filters.PageNumber;
      filters.PageSize = filters.PageSize == 0 ? _paginationOptions.DefaultPageSize : filters.PageSize;

      var posts = _unitOfWork.PostRepository.GetAll();

      if (filters.UserId != null)
      {
        posts = posts.Where(x => x.UserId == filters.UserId);
      }

      if (filters.Date != null)
      {
        posts = posts.Where(x => x.Date.ToShortDateString() == filters.Date?.ToShortDateString());
      }

      if (filters.Description != null)
      {
        posts = posts.Where(x => x.Description.ToLower().Contains(filters.Description.ToLower()));
      }

      var pagedPosts = PagedList<Post>.Create(posts, filters.PageNumber, filters.PageSize);

      return pagedPosts;
      //return _unitOfWork.PostRepository.GetAll();
    }

    public async Task InsertPost(Post post)
    {
      var user = await _unitOfWork.UserRepository.GetById(post.UserId);
      if( user == null)
      {
        throw new BusinessException("User doesn't exist");
      }
      
      var userPost = await _unitOfWork.PostRepository.GetPostsByUser(post.UserId);
      if(userPost.Count() < 10)
      {
        //Este caso es si lo quisiera ordenar, pero ya estan ordenados en cuanto a fecha gracias al id
        //var lastPost = userPost.OrderBy(x => x.Date).LastOrDefault();

        //el siguiente caso ordena las fechas de los post xq no esta configurado para tomar la fecha del sistema, sino que entre por parametro
        var lastPost = userPost.OrderByDescending(x => x.Date).FirstOrDefault();
        if ( (DateTime.Now - lastPost.Date).TotalDays < 7) 
        {
          throw new BusinessException("You are no able to publish the post");
        }
      }
      
       _unitOfWork.PostRepository.Add(post);
      await _unitOfWork.SaveChangesAsync();
    }

    public async Task<bool> UpdatePost(Post post)
    {
       _unitOfWork.PostRepository.Update(post);
      await _unitOfWork.SaveChangesAsync();
      return true;
    }
  }
}
