using SocialMedia.Core.Entities;
using SocialMedia.Core.Exeptions;
using SocialMedia.Core.Interfaces;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System;

namespace SocialMedia.Core.Services
{
  public class PostService : IPostService
  {
    private readonly IUnitOfWork _unitOfWork;
    //private readonly IRepository<Post> _postRepository;
    //private readonly IRepository<User> _userRepository;
    public PostService( IUnitOfWork unitOfWork)
    {
      _unitOfWork = unitOfWork;
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

    public IEnumerable<Post> GetPosts()
    {
      return _unitOfWork.PostRepository.GetAll();
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
