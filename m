Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A53B754774
	for <tools@linux.kernel.org>; Tue,  3 Mar 2026 01:58:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772503126; cv=none; b=dzANzweSR0oGY6W0NMCkgv+hQs3oLclZV/fj2MoFABFuqLqkU3bLtSyA0LTWho7hxC6PtqtIIrV4ReXswZzKTffr3A6UlSNvUkop+fEhVbk+MZJhuJiQoUzCcdEKFWFnJ52i0iIi6ZuheTgektRdWOdjJbk7txF6nplvy4XdtIE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772503126; c=relaxed/simple;
	bh=rn0Jnfz825kZq4lG+W6VqOIBYwpVNtQ99Jbn4vizsY4=;
	h=From:To:Cc:Subject:In-Reply-To:Date:Message-ID:MIME-Version:
	 Content-Type; b=Bs0INTCanrWnO+qoeXD8a/MQ5qLJCx6kIuF52UeRUABZ6TwHM7XkiFhyBhGnZ15iV6GtV88liF3uBS3pRk2y1mDwccoRrS4btLoOD8y5ToXD1g0cnNu8NpuMVNXMLOBmwpBbO9z1q5mO4HqeyO2yE94GuyHcSBTZRFje+mBgRFc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=pobox.com header.i=@pobox.com header.b=KPDZslxv; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=HJrtHsxn; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pobox.com header.i=@pobox.com header.b="KPDZslxv";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="HJrtHsxn"
Received: by smtp.kernel.org (Postfix)
	id 7924DC2BC9E; Tue,  3 Mar 2026 01:58:46 +0000 (UTC)
Received: from fhigh-a7-smtp.messagingengine.com (fhigh-a7-smtp.messagingengine.com [103.168.172.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 641ACC19423;
	Tue,  3 Mar 2026 01:58:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 641ACC19423
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=pobox.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=pobox.com
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 765E014001E3;
	Mon,  2 Mar 2026 20:58:43 -0500 (EST)
Received: from phl-frontend-01 ([10.202.2.160])
  by phl-compute-01.internal (MEProxy); Mon, 02 Mar 2026 20:58:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pobox.com; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to; s=fm3; t=1772503123; x=1772589523; bh=rn0Jnfz825kZq4lG+W6Vq
	OIBYwpVNtQ99Jbn4vizsY4=; b=KPDZslxv6RAVyXtOw7a0dHcwG/DNlyj+U91CK
	OGmdCZFV6B+ZOcipAFMwmcMDZYohYOx6ASdEohM+GcV4VaV1cUnKB5sQxIZUJUNF
	xkWfQFE0vLBAMjzU1i1SWI5SnP7PbW/BWldMvcwPOH/zzGeTQUWz2IMg6rbWKdPw
	fLzb1p9RBlvT58oizlna2KemAoctTG5XTV5A4qCdyMyajq62WlqOasw2ueppq8Um
	HBUhEYMnHxT0GxAxvMtGsnTVnzBj99apSlF8PCaygXYIJoTtBwiNCw496w2qzC6J
	iWt4l/FimJ02ozC616NtpwikAgSyU5MZ5VUV5fJE28UWGWFtw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:reply-to:subject:subject:to:to
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1772503123; x=1772589523; bh=rn0Jnfz825kZq4lG+W6VqOIBYwpVNtQ99Jb
	n4vizsY4=; b=HJrtHsxnHet5nf7e2mZ4LLmDmhPAVPMkeXYKkAvDAqpIyxolF3D
	khUdzWecRGkfl4E8KKcSuV9ix3PSAiYwG2lcdg0MyUcG/vmRJ6PDRFHsAinLVZ7U
	Z+OeiRGSxMHIFitZlroUL4mHqCfkEqsJK8aOZ3iJVDJ4jHmXtu09ImUU42oRkIGp
	cxe9t42kclw/7cvPgYdao0RydWw5p0EyAYEgfs6zd7QbnKD3KDqTom33wq/Lc+sf
	jIjJlQWifXAjBN24IOkhniT/gISPuzQS345hKzhBQJpEjLdCfX7HvZ7R5IMSbYj1
	iLVi7xAdZ0i3qjj8YO6pR2qhRytk46dytwg==
X-ME-Sender: <xms:U0CmaciAcT40uPPPTizpou3jyYGBqsCF-l9H6JK8LzNR1LiRV5eIog>
    <xme:U0CmaVIG-cLRYD74VX1BNIg5Xb5xWbY0T5dvY33Ep2x4721IO2ET6W1CWvP0lEZTX
    OriEQ-kYpWsyG0Z7D4ElFbom6Xs9ipTTBcM7Xk24zKJm_vtZN0M2g>
X-ME-Received: <xmr:U0CmacBmIB15m0qxTFqN39Z_nPy57wxtFwRJ4mHHJBGJFFK1ZFhzQ3ajf1I5ubwDCFCcj-nph-7DfMckgrPhSu6qrDLfr9hnjQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddvheelfedtucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucenucfjughrpefhvfevufgjfffkfgggtgesthdtofdttd
    ertdenucfhrhhomheplfhunhhiohcuvecujfgrmhgrnhhouceoghhithhsthgvrhesphho
    sghogidrtghomheqnecuggftrfgrthhtvghrnhepvddttdejudeikeethfehvdethedvje
    eigfduleehkefgjeeuleekleefleeftedvnecuvehluhhsthgvrhfuihiivgeptdenucfr
    rghrrghmpehmrghilhhfrhhomhepghhithhsthgvrhesphhosghogidrtghomhdpnhgspg
    hrtghpthhtohepgedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepmhhrihgtohhn
    sehkvghrnhgvlhdrohhrghdprhgtphhtthhopehushgvrhhssehkvghrnhgvlhdrohhrgh
    dprhgtphhtthhopehtohholhhssehkvghrnhgvlhdrohhrghdprhgtphhtthhopehgihht
    shhtvghrsehpohgsohigrdgtohhm
X-ME-Proxy: <xmx:U0CmaVgASx_WxQDC-1G16tpeCwyRE7eq0HbGCJTX9a0jgMJ1QNPqXg>
    <xmx:U0CmaUlDSMRuwdEOl_9GgdrD615WVVi6WuWvCuO_5l32uhOlNFpDuA>
    <xmx:U0CmaRpKpK0qOlGIFmkG-w8BKUwhADkSQw35pKDjbuwUsjytZVz7xw>
    <xmx:U0CmadEewBKofhZu8hxzIIbxhLXYvb-bhSXWSHiNGRDDKiQvRMZV8Q>
    <xmx:U0CmaTjO_WaxhiwGU8JgxWcHTL-TsP6UX4J30i_dciMi_3rrIlOYDPIe>
Feedback-ID: if26b431b:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 2 Mar 2026 20:58:42 -0500 (EST)
From: Junio C Hamano <gitster@pobox.com>
To: Konstantin Ryabitsev <mricon@kernel.org>
Cc: users@kernel.org,  tools@kernel.org
Subject: Re: b4 review available in master
In-Reply-To: <20260227-imported-aromatic-guppy-ad3dca@lemur>
Date: Mon, 02 Mar 2026 17:58:41 -0800
Message-ID: <xmqqikbdvfla.fsf@gitster.g>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

I hate to complain about trivialities, but the coloring scheme was
too noisy and with weaker color perception than normal folks, I
couldn't really see many of the UI elements in "b4 review tui".

Is there a monochrome option that is usable by color challenged
people?

Thanks.
