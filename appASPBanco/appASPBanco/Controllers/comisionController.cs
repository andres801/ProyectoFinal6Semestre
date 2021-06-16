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
    public class comisionController : Controller
    {
        private Banco db = new Banco();

        // GET: comision
        public ActionResult Index()
        {
            return View(db.comision.ToList());
        }

        // GET: comision/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            comision comision = db.comision.Find(id);
            if (comision == null)
            {
                return HttpNotFound();
            }
            return View(comision);
        }

        // GET: comision/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: comision/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "idComision,nombreComision,montoComision,estatus")] comision comision)
        {
            if (ModelState.IsValid)
            {
                db.comision.Add(comision);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(comision);
        }

        // GET: comision/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            comision comision = db.comision.Find(id);
            if (comision == null)
            {
                return HttpNotFound();
            }
            return View(comision);
        }

        // POST: comision/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "idComision,nombreComision,montoComision,estatus")] comision comision)
        {
            if (ModelState.IsValid)
            {
                db.Entry(comision).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(comision);
        }

        // GET: comision/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            comision comision = db.comision.Find(id);
            if (comision == null)
            {
                return HttpNotFound();
            }
            return View(comision);
        }

        // POST: comision/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            comision comision = db.comision.Find(id);
            db.comision.Remove(comision);
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
