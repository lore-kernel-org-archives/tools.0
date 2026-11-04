Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793790750;
	b=H6b8QU5zMdT2FBlZ/1JQY5lco7CMqn3T3ht5sXYyEihbhLPPnMaVFOYd49F2c0KBGHOQ
	 f0dr14JAqphiBpyMQywyYfgR6I5kgvVBYvRMQYt50uxvg4PzsGhEoq0W8+YpD6l34PZfU
	 9R0FQUclxuDJdvrsuqWQ+uWdUOcIaYJH5s9AnGNVX+wFoGQIVA3H3lJLbKu8FllhPTlOA
	 PgcWAQcTs/X4ENJn0iFl8WuOUstaBNDlMvecjPgV64cyfF2zZ9TcJpgyHbcP6p3+U2rNw
	 kVpWpaumK7TnLxbv1ydoFaR3r1JJw7YjCBtNuAXDoPAuS4sVorvRMRcsZe60yRq5ZDw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793790750;
	h=Received:Delivered-To:Received:DMARC-Filter:DKIM-Signature:
	 X-UI-Sender-Class:Received:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:
	 UI-OutboundReport;
	bh=4IVs2I6BQUGApkdf4lP8lToqI5JAWoaEnyulw32K3vg=;
	b=T++d40XYdByUMIX8rnejYnSePftgj2aoqCUxqCMYfv1LtBdh84zJW1iab5tAte0Wkmhj
	 eOLEl6vB/USh/ZPutQ5TMTnj6sQXZuYc6LnM3e69QYhXRU0CrrYRFt/P+fPkdb7dR3g9p
	 2huzVNjwFOkkqqbnDKV1kzaHqa7K3R6TGlvwErYhL4/nHdyL1djG6v5BK5n1/7G3fYLSU
	 XOtho7bgeDUD0Mqt61iTQ0Ix3Aun22cSgDHf+2cY72L13qMTWozo7abXRg2FEsx7AcL79
	 30CgsfkKxZNiExnREB5625x5+gHZU7mwPZSlDANOdspSohvk73qRD2WqAS+tDyI0ViQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=web.de header.i=markus.elfring@web.de header.a=rsa-sha256 header.s=s29768273 header.b=ddbtBrjJ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E8EF606A326
	for <tools@linux.kernel.org>; Wed,  4 Nov 2026 11:12:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=web.de header.i=markus.elfring@web.de header.a=rsa-sha256 header.s=s29768273 header.b=ddbtBrjJ
Received: by smtp.kernel.org (Postfix)
	id 287741F00919; Wed,  4 Nov 2026 11:12:30 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=212.227.15.4
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1793790750;
	b=xn/7uU+tHu11lUtErzE8W4iJGz7o6v1miLw9mJu6cX0WlLqI8SLiSodvveWpBzHVZhQm
	 MAuDnVaZezgH8XOLH3K0wST9/EqTieabDqCIaBRmh6B2vKCv7a1TZSttZ+43uE49MYAPi
	 /4Ku+KEfLJxh32pgNpwbnu0Q/CCJNIIoI5TGVhWVUG76477P+PI1komx+8uNFndIMHBKm
	 lkISDEZM8nfCFoKV/8k6LhV0y1G/jgE7VwxbHD2AAFi4lWJ/GyyliabiM9rhLFo8mCONr
	 NM+ovsH0QkIDgHPHCYjvzPZUNt7RgZJ1ps5chb0dYMjjEn7K0FaliZmvYyiIhOavOqA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793790750;
	h=DMARC-Filter:DKIM-Signature:X-UI-Sender-Class:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:UI-OutboundReport;
	bh=4IVs2I6BQUGApkdf4lP8lToqI5JAWoaEnyulw32K3vg=;
	b=wkKkgmbSDxBcVE91Qb5/YF7nBA+1SzxXFGqaMfWjfkXBP6wFPFsGNqfljAvFfufkLVaE
	 iBOWEV4aXfyftpNjl4oFFGtfUniJFQ/K/7aNpUSdHHNyYGgGtWYKbu0LmDnhBi6ABnV5K
	 I4XrhhIRALroGppB0r2yAlsCiKQrRu/6wqKCShePPHdJQ9M1sMb1lZknMtzJh9vgTB8Kb
	 BXF3/XCzW7lLBCeqZSIlGLT0t5oclDNN+lyHj20EC16iseqkTXNtvm1RC1dtAF8QbfGfd
	 Nz6esR9ZuebHDj9pCWwA6YD/Rbfb6V/19RSFqVdFBe8dq5MRVCuLB1aI0RbSLG13D1g==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	dkim=pass header.d=web.de header.i=markus.elfring@web.de header.a=rsa-sha256 header.s=s29768273 header.b=ddbtBrjJ;
	dmarc=pass header.from=web.de;
	spf=pass smtp.mailfrom=web.de;
	arc=none smtp.remote-ip=212.227.15.4
Received: from mout.web.de (mout.web.de [212.227.15.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id E37621F000C1
	for <tools@kernel.org>; Wed,  4 Nov 2026 11:12:28 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=web.de header.i=markus.elfring@web.de header.a=rsa-sha256 header.s=s29768273 header.b=ddbtBrjJ
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org E37621F000C1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1793790740; x=1794395540; i=markus.elfring@web.de;
	bh=4IVs2I6BQUGApkdf4lP8lToqI5JAWoaEnyulw32K3vg=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=ddbtBrjJpCwOvsUojyE2a2/SD0GEV0dyxl2rHT+MT0uKTDRkmdTSkyKa4A2q14ME
	 tRFUY//smob4gpjzlGxM8kqEhVIyx9lQmQqsxW8GAH0/txUgYww6PM0WhQun67lKw
	 rI3bMWoq6JzqP5bDnITHaHWCRb0XYJjPTrFz9HJP4cad/prlx4R3MLvDcnudaoQ5i
	 s2ysGzFLrltrlcMDN2IFgvfNdD+3qbf5UUHPdJ79nuDsFvputp3ie0TvdYl4vT2Y1
	 LOhsvYvGodNtervKcxO8LegKRwKqPEwU5NsQGh28pQsJBwgS+oGIutjuGALxmI/Fz
	 uIf0EA3IpnOlAyMEHA==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from client.hidden.invalid by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MQxs3-1xBgtH2MbP-00TjHy; Wed, 04
 Nov 2026 12:12:20 +0100
Message-ID: <1aa14886-503b-4e35-8ab1-f63c1942c7f1@web.de>
Date: Wed, 4 Nov 2026 12:12:10 +0100
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Post: <mailto:tools@linux.kernel.org>
List-Help: <mailto:tools+help@linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
List-Owner: <mailto:tools+owner@linux.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC] Replacing special goto statements by direct returns?
To: Julia Lawall <julia.lawall@inria.fr>, cocci@inria.fr
Cc: tools@kernel.org, kernel-janitors@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>
References: <52418f50-b3ff-461d-8e66-c10f70e35b2a@web.de>
 <161f567a-f33-7865-8787-844a299ef9c1@inria.fr>
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <161f567a-f33-7865-8787-844a299ef9c1@inria.fr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:JebthncGfwuVXPr1DYhkIAV8c7xV0vnUxPKZgLIvW51HNQwxnkH
 QgU/NdJUEW4akGI455DgRTJekIFVu208xOZomT89AYEy6VSwoe99snNVtf/rjQ+4f4c2xt/
 iafcxEufdmi03/BVCiGRsMbzcvhQsEUGTEfU4lGeXZ6OiJNPpkwp4Nec7c+XAfxGGZeuyBi
 JULLvJpX6BUaVISgG+eig==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:qu5W9QmvmTk=;x8TQW3vaTlT8+RJy8VtBZkkR+Qp
 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

> I think you can do:

Which computation tree logic variations do support data processing
for unreachable source code fragments?

Regards,
Markus
