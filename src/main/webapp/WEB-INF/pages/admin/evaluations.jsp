<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fn" uri="jakarta.tags.functions" %>
<div class="flex items-center justify-between px-8 py-4 bg-white border-b border-[#E9EAE2]">
      <p class="text-sm text-[#6E6D5F]">Espace administrateur <span class="mx-2">›</span> <span class="text-[#2F3A2F]">Évaluations</span></p>
      <span class="text-sm text-[#6E6D5F] border border-[#E3E1D6] rounded-md px-3 py-1.5">2024 — 2025</span>
    </div>
    <div class="px-8 py-8">
      <p class="text-xs tracking-widest uppercase text-[#9A9886] mb-2">Votre espace, en un coup d'œil</p>
      <div class="flex items-end justify-between mb-8">
        <div><h1 class="text-3xl font-medium text-[#2F3A2F]">Évaluations</h1>
        <p class="text-sm text-[#6E6D5F] mt-1">Suivez les évaluations et les résultats des soutenances.</p></div>
        <div class="flex gap-3">
          <button class="border border-[#E3E1D6] bg-white rounded-lg px-4 py-2.5 text-sm">Exporter</button>
          <button type="button" onclick="openModal('modalPlanifier')" class="bg-[#2F5B45] text-white rounded-lg px-4 py-2.5 text-sm">+ Planifier une soutenance</button>
        </div>
      </div>
      <div class="bg-white rounded-xl border border-[#ECEEE6] p-6">
        <h3 class="text-lg font-medium text-[#2F3A2F]">Suivi des évaluations</h3>
        <p class="text-sm text-[#9A9886] mb-5">Une note finale calculée à partir des évaluations du jury.</p>
        <div class="divide-y divide-[#F1F2EC]">
          <c:forEach var="ev" items="${evaluations}">
          <div class="flex items-center gap-4 py-4"><span class="w-9 h-9 rounded-full bg-[#E7EFDF] text-[#5B7A4A] flex items-center justify-center text-xs">${fn:substring(ev.prenometu,0,1)}${fn:substring(ev.nometu,0,1)}</span><div class="flex-1"><p class="font-medium text-sm">${ev.nometu} ${ev.prenometu}</p><p class="text-xs text-[#9A9886]">${ev.sujetetu} — ${ev.enseignantnom} (${ev.qualitemembre})</p></div>
            <c:choose>
              <c:when test="${not empty ev.noteattribuee}"><span class="bg-[#E6EEF5] text-[#4A6E8A] rounded-md px-2.5 py-1 text-xs">● Notée</span><p class="text-sm text-[#5B7A4A] font-medium">${ev.noteattribuee} / 20</p></c:when>
              <c:otherwise><span class="bg-[#F5E9DE] text-[#B07A45] rounded-md px-2.5 py-1 text-xs">● En attente</span><p class="text-sm">— / 20</p></c:otherwise>
            </c:choose>
          </div>
          </c:forEach>
        </div>
      </div>
    </div>


