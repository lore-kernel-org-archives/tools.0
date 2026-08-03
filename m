Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AA0F2874F5
	for <tools@linux.kernel.org>; Mon,  3 Aug 2026 17:16:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=100.103.45.18
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785777367; cv=pass; b=aaubSM/UjwxjFiNZAigwyRHBIhs7TevJIdujXqFh3fCNd2T8Ndp14GgTpEMy0BKu6ELsL07kitXT4Wlr2BL/sTlf7ZTGASI/Gl99VUkiMHBE+3/almIPbuRtfXqlm0yX4i8XRzQ6HtwrjuMrQTBwTjJSLNUDsuFa1yeDOt7xdzM=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785777367; c=relaxed/simple;
	bh=ZRZKDH1bgUKdskcUSY9IUVd/N72kbZzsjzOq8/55J3c=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:From:To:
	 References:In-Reply-To; b=k0KKhA0ar5QSwVFKkumlivQbqnjVe5nGa9z+/Zm8idRFLQ/3X/DTkMsJJfrO2Ax7CtZlkSznGJjag/Xaihz7rOJ9J4VjHF3B5CjyYp7ABiZH3AupuJE1X7bONxQFS/2Vkis8Js+7UmyX5DHfPGJw0hTulXPWhixVJR9kw0BEk+c=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=ritovision.com header.i=rito@ritovision.com header.b=iBF6tR0K; arc=pass smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ritovision.com header.i=rito@ritovision.com header.b="iBF6tR0K"
Received: by smtp.kernel.org (Postfix)
	id 55C7E1F00A3A; Mon,  3 Aug 2026 17:16:06 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=136.143.188.15
ARC-Seal: i=2; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=pass;
	t=1785777366;
	b=ixapz3YIlWpCvbiNXRDQU6FiA0dVw64auNMxNdLZ/arQ8WQIkbJG127SFtDkKWixswaC
	 9lYvZfWdcpfh3L6o1QTml3R0tOyliaGkZe2aFeUGAqG70BYbBSYYKNpk3K2T3VjvYVURZ
	 TFmKCZtqCoa41M4rngBDLSEY0fijtBgYPe67PkVt2ugfkl8Of8yhcZha69dZVsMVCH0zq
	 05XJtyoS/ks5nryP9zD0VJEE0RaT1WjzwfanEgJJ2AjDjFs/Gd6wC6F2z8RI2Kwg+T/Fj
	 T1V1BEr0aa4Em8Wm08QPiK4ogwEsb4S2qitD+Vyi75BtCjnALM03aM7W1SurwDwZT8A==
ARC-Message-Signature: i=2; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1785777366;
	h=DMARC-Filter:DKIM-Signature:Received:Mime-Version:
	 Content-Transfer-Encoding:Content-Type:Date:Message-Id:Subject:Cc:
	 From:To:X-Mailer:References:In-Reply-To:X-ZohoMailClient;
	bh=ZRZKDH1bgUKdskcUSY9IUVd/N72kbZzsjzOq8/55J3c=;
	b=UiwuB9xrr8ZqNjIhThib3DBZO/SJIsUxQP7SXX5W6EsrSkMa6R+pfkWOXwvVnzkFwWm2
	 Wa8UsPbXWvp8SEQwalTtVvjb5dcCOdfO6FwXirUjS740xeF7o975GCEudAiN7QuFhzTYW
	 yiVK51T2Yw8zUg05jFj6Q6MT03/eqlAjZL+luFfesZ2o2XjeNhIzjj8K80zb3NUHxZxo2
	 0rb7OGSJmuUXrvkopsj8emcLl4aKJqnFu5MZRfkW8xaMD9fhJQ7NKWlkfk6wzOtXx14Zy
	 GykjPYD9Km12LTTbP0UqF6NZg3mo3eAThsICRVEWIvegoCd1jjLmo4HbcSzBI3TgGKg==
ARC-Authentication-Results: i=2; smtp.kernel.org; dkim=pass header.d=ritovision.com header.i=rito@ritovision.com header.a=rsa-sha256 header.s=zmail header.b=iBF6tR0K;
	dmarc=pass header.from=ritovision.com;
	spf=pass smtp.mailfrom=ritovision.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=136.143.188.15
Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 8A3381F000E9;
	Mon,  3 Aug 2026 17:16:05 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=ritovision.com header.i=rito@ritovision.com header.a=rsa-sha256 header.s=zmail header.b=iBF6tR0K
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 8A3381F000E9
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=ritovision.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=ritovision.com
ARC-Seal: i=1; a=rsa-sha256; t=1785777362; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=UTagvb7Mc46wOJTS1c/OjHg9fBWMVbzb9NVAdFqTdsHftPgM0BBA1Kr0kNveaMQoYwU2HjIhsSU+UFnC+NR7aSBMpQOidMT2B6c82BxWf5EIQZazmnuKPl3jze/y4c9gsJ3DyCKay9KtLh4bPlo37sQyjVVnCtInuorLiqFSo4E=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1785777362; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=ZRZKDH1bgUKdskcUSY9IUVd/N72kbZzsjzOq8/55J3c=; 
	b=YsZ9Huw7YaTHH3s6hp9qiVXAB3MOWNF7DI5K/n/iET0ad1Nw8lmAjqLSFgt/bjoeiUBetnygH4yp30mp+J7QC9k2/MFntL+N8NzQSvVYkJSb3PCi9pC/NMpmNZj+OgjZu1ZTXcFbO76AsTgtk3tRCQ8rasGTWq8iXSv+F4eBkQg=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=ritovision.com;
	spf=pass  smtp.mailfrom=rito@ritovision.com;
	dmarc=pass header.from=<rito@ritovision.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1785777362;
	s=zmail; d=ritovision.com; i=rito@ritovision.com;
	h=Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Date:Message-Id:Message-Id:Subject:Subject:Cc:Cc:From:From:To:To:In-Reply-To:Reply-To;
	bh=ZRZKDH1bgUKdskcUSY9IUVd/N72kbZzsjzOq8/55J3c=;
	b=iBF6tR0KMKxN6fwMWPj9aAlrUpLBC5j5MzYI7iuYws4pn+UW9w758elljvEoWBg+
	0xfh3+fG/tk173fE9l4tkf/3FC4rkKxxB5cSJu5OxP0Ror1PgMOEA2QZXQEwNdbYU72
	rweDsWuKYeVsoTjKB4un0uYpYAe3oR1InoCm6Wl8=
Received: by mx.zohomail.com with SMTPS id 1785777360637105.11148743949911;
	Mon, 3 Aug 2026 10:16:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 03 Aug 2026 13:15:56 -0400
Message-Id: <DKFH8OBQKN6F.1SOFYEYNCJC5H@ritovision.com>
Subject: Re: [PATCH v1 1/2] add mobile drawer navigation with a compact
 sticky top bar
Cc: <tools@kernel.org>
From: "Rito Rhymes" <rito@ritovision.com>
To: "Konstantin Ryabitsev" <mricon@kernel.org>, "Rito Rhymes"
 <rito@ritovision.com>
X-Mailer: aerc 0.21.0
References: <20260803153502.32096-1-rito@ritovision.com>
 <20260803-curly-sly-guan-18e09a@meerkat>
In-Reply-To: <20260803-curly-sly-guan-18e09a@meerkat>
X-ZohoMailClient: External

Really? It tested well for me on Chrome Desktop on Windows before
I submitted it, across both desktop and mobile viewport sizes.

What problems did you see?
