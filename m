Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 477F233507C
	for <tools@linux.kernel.org>; Fri, 31 Jul 2026 04:59:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785473950; cv=none; b=Pr7/ScGekpaM50kujjtfTuLt4hRfObp0fZ8lJJHCrM+XVazVsC5ta+a1M1+YHIcL28SwczLZZSZSCIJiiX1xcZd1BAQuUEaSViE3tEaummMmlKsWNtYI9KX/pgfELuskAZSTZJIZ+UZzC3k8/tWFP1vqzbgeC4r09uMuNXXEJwA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785473950; c=relaxed/simple;
	bh=o1JfyDp6KzNFzBRxI3MOLM16EQ0OWPCGr5YkZyuGBGc=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=kzswxtWWFCGZo5yK+wQgxhcZJP+6UH0jbZVzUUPE4phDe9lUyowkEciqqI/TPuI88/LpigLL4JfpE148DMrS7ZN10DY4uq1l6YnztkzDP4K79l20TYc0K6FnReWSXVpX2duZWVRuCsIWCOtkqZljm2gi02HbicYIP45p14WoJpU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=T065PoOq; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="T065PoOq"
Received: by smtp.kernel.org (Postfix)
	id D63C31F00A3A; Fri, 31 Jul 2026 04:59:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8FCCD1F000E9;
	Fri, 31 Jul 2026 04:59:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1785473948;
	bh=ncpLPS/GnDSCtMj3JjN6GasESiC4Uibycuej2L4UEQ4=;
	h=From:To:In-Reply-To:References:Subject:Date;
	b=T065PoOqov5EUYr/hOWjZvHstIkyWRJ02fqt8gQ7lkR6qXQ9BBorKnn5gjKppaTwr
	 Y2D0M+VJ+abLT4Cgjnz/2VB5ropkp1qslyuEWK2Vpu72xcr4TJvB8cMixsyB9FA8ki
	 XJWvsNYxeCdvFlGMv6i1bHqddspvOeGVAaEZ45NE=
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: "Kernel.org Tools" <tools@kernel.org>, 
 Christian Brauner <brauner@kernel.org>
In-Reply-To: <20260729-work-b4-cover-subject-v1-0-718507ed317b@kernel.org>
References: <20260729-work-b4-cover-subject-v1-0-718507ed317b@kernel.org>
Subject: Re: [PATCH b4 0/2] b4 review: cover-letter titling on the update
 path
Message-Id: <178547394498.3880964.2810404048348377664.b4-ty@b4>
Date: Fri, 31 Jul 2026 04:59:04 +0000
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=987;
 i=konstantin@linuxfoundation.org; h=from:subject:message-id;
 bh=pq0SVaMbnMUo1DjZ+Hl/0W16g8/pMGUqiM3A9qL1I/c=;
 b=owGbwMvMwCW27YjM47CUmTmMp9WSGLJytGfzCO5w+JWfoJZ48t42hVW1+g46Fi//35zQnJj+f
 u1tVn+DjlIWBjEuBlkxRZayfbGbggofesil95jCzGFlAhnCwMUpABM51snwh9P0mEOmSUfdk8Bv
 9z51hvhXSdQ7nmGexppjG31xi3NkJcP/4GkfhC8sWynjeGzN/ib3rQvkfOp0nBgbVuWIzn/mPZm
 bFQA=
X-Developer-Key: i=konstantin@linuxfoundation.org; a=openpgp;
 fpr=DE0E66E32F1FDD0902666B96E63EDCA9329DD07E


On Wed, 29 Jul 2026 10:58:16 +0200, Christian Brauner wrote:
> b4 review: cover-letter titling on the update path
> 
> Commit 83551c65f68d ("review: identify discovered revisions by their
> cover letter") fixed how discovered revisions are identified, but the
> copy of the recording loop in update_series_tracking() -- what
> pressing 'u' in the tracking TUI runs -- was left as is. Newly
> discovered revisions were still identified by their first present
> patch, so upgrading a series re-titled it after patch 1/N, and since
> series.subject is only written on track or upgrade, the row kept that
> title forever.
> 
> [...]

Applied, thanks!

[1/2] b4 review: identify updated revisions by their cover letter too
      commit: d0b501a40a210a3136587f5ab4b55c56f73e1073
[2/2] b4 review: test cover-letter titling on the update path
      commit: dbcb2505b76d50476aef902aabdbf0b05411f509

Best regards,
-- 
Konstantin Ryabitsev <konstantin@linuxfoundation.org>

