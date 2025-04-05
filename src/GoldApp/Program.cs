using Microsoft.AspNetCore.Mvc;

namespace GoldApp.Controllers
{
    [ApiController]
    [Route("[controller]")]
    public class HomeController : ControllerBase
    {
        [HttpGet]
        public IActionResult Get()
        {
            return Ok("🎉 API is working!");
        }
    }
}
