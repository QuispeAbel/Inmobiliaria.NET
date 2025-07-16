using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;
using SocialMedia.Core.Entities;
using SocialMedia.Core.Interfaces;
using SocialMedia.Infrastructure.Data;

namespace SocialMedia.Infrastructure.Repositories
{
  public class UnitOfWork : IUnitOfWork
  {
    private readonly SocialMediaContext _context;
    private readonly BaseRepository<Post> _postRepository;
    private readonly BaseRepository<User> _userRepository;
    private readonly BaseRepository<Comment> _commentRepository;

    public UnitOfWork( SocialMediaContext context)
    {
      _context = context;
    }
    public IRepository<Post> PostRepository => _postRepository ?? new BaseRepository<Post>(_context);

    public IRepository<User> UserRepository => _userRepository ?? new BaseRepository<User>(_context);

    public IRepository<Comment> CommentRepository => _commentRepository ?? new BaseRepository<Comment>(_context);

    public void Dispose()
    {
      if (_context != null) {
      _context.Dispose();
    }
    }

    public void SaveChanges()
    {
      _context.SaveChanges();
    }

    public async Task SaveChangesAsync()
    {
      await _context.SaveChangesAsync();
    }
  }
}
