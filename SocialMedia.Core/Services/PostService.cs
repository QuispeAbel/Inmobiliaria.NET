using SocialMedia.Core.Entities;
using SocialMedia.Core.Exeptions;
using SocialMedia.Core.Interfaces;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace SocialMedia.Core.Services
{
  public class PostService : IPostService
  {
    private readonly IRepository<Post> _postRepository;
    private readonly IRepository<User> _userRepository;
    public PostService(IRepository<Post> postrepository, IRepository<User> userRepository)
    {
      _userRepository = userRepository;
      _postRepository = postrepository;
    }

    public async Task<bool> DeletePost(int id)
    {
      await _postRepository.Delete(id);
      return true;
    }

    public async Task<Post> GetPost(int id)
    {
      return await _postRepository.GetById(id);
    }

    public async Task<IEnumerable<Post>> GetPosts()
    {
      return await _postRepository.GetAll();
    }

    public async Task InsertPost(Post post)
    {
      var user = await _userRepository.GetById(post.UserId);
      if( user == null)
      {
        throw new BusinessException("User doesn't exist");
      }
      await _postRepository.Add(post);
    }

    public async Task<bool> UpdatePost(Post post)
    {
      await _postRepository.Update(post);

      return true;
    }
  }
}
