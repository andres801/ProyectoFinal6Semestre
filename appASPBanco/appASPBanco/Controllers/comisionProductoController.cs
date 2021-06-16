using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using appASPBanco.Models;

namespace appASPBanco.Controllers
{
    public class comisionProductoController : Controller
    {
        private Banco db = new Banco();

        // GET: comisionProducto
        public ActionResult Index()
        {
            return View(db.comisionProducto.ToList());
        }

        // GET: comisionProducto/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            comisionProducto comisionProducto = db.comisionProducto.Find(id);
            if (comisionProducto == null)
            {
                return HttpNotFound();
            }
            return View(comisionProducto);
        }

        // GET: comisionProducto/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: comisionProducto/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "idComisionProducto,idComision,idProducto,estatus")] comisionProducto comisionProducto)
        {
            if (ModelState.IsValid)
            {
                db.comisionProducto.Add(comisionProducto);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(comisionProducto);
        }

        // GET: comisionProducto/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            comisionProducto comisionProducto = db.comisionProducto.Find(id);
            if (comisionProducto == null)
            {
                return HttpNotFound();
            }
            return View(comisionProducto);
        }

        // POST: comisionProducto/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "idComisionProducto,idComision,idProducto,estatus")] comisionProducto comisionProducto)
        {
            if (ModelState.IsValid)
            {
                db.Entry(comisionProducto).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(comisionProducto);
        }

        // GET: comisionProducto/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            comisionProducto comisionProducto = db.comisionProducto.Find(id);
            if (comisionProducto == null)
            {
                return HttpNotFound();
            }
            return View(comisionProducto);
        }

        // POST: comisionProducto/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            comisionProducto comisionProducto = db.comisionProducto.Find(id);
            db.comisionProducto.Remove(comisionProducto);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}
