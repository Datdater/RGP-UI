using Microsoft.AspNetCore.Mvc;

namespace RPG_Front_end.Controllers
{
    public class PaymentController : Controller
    {
        public IActionResult Index()
        {
            return View();
        }

        public IActionResult ExcutePayment(string orderCode)
        {
            return View("ExcutePayment", orderCode);
        }
    }
}
