using SocialMedia.Core.Entities;
using SocialMedia.Core.Exeptions;
using SocialMedia.Core.Interfaces;
using System.Collections.Generic;
using System.Threading.Tasks;

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
