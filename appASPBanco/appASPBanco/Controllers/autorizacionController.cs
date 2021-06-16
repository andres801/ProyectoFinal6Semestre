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
    public class autorizacionController : Controller
    {
        private Banco db = new Banco();

        // GET: autorizacion
        public ActionResult Index()
        {
            return View(db.autorizacion.ToList());
        }

        // GET: autorizacion/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            autorizacion autorizacion = db.autorizacion.Find(id);
            if (autorizacion == null)
            {
                return HttpNotFound();
            }
            return View(autorizacion);
        }

        // GET: autorizacion/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: autorizacion/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "idAutorizacion,descripcionAutorizacion,estatus")] autorizacion autorizacion)
        {
            if (ModelState.IsValid)
            {
                db.autorizacion.Add(autorizacion);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(autorizacion);
        }

        // GET: autorizacion/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            autorizacion autorizacion = db.autorizacion.Find(id);
            if (autorizacion == null)
            {
                return HttpNotFound();
            }
            return View(autorizacion);
        }

        // POST: autorizacion/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "idAutorizacion,descripcionAutorizacion,estatus")] autorizacion autorizacion)
        {
            if (ModelState.IsValid)
            {
                db.Entry(autorizacion).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(autorizacion);
        }

        // GET: autorizacion/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            autorizacion autorizacion = db.autorizacion.Find(id);
            if (autorizacion == null)
            {
                return HttpNotFound();
            }
            return View(autorizacion);
        }

        // POST: autorizacion/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            autorizacion autorizacion = db.autorizacion.Find(id);
            db.autorizacion.Remove(autorizacion);
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
