Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1B3A2820B7
	for <tools@linux.kernel.org>; Mon, 13 Oct 2025 08:27:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760344049; cv=none; b=brEMjGCdymVUisaeROHMk6PtWvsO+K64DfTf9ZI5GebC6+M5QsQC7oOXJj3dWFnhNG60ctJQknRuEy+2uasYciE7DmmpnUzjVcpGHuObI/zaSnHpnPl4ZTwjDlbRKVXlHER4CWbZTWpgOhi179+OLAddU80b8Tqk4tjQGnH6VCA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760344049; c=relaxed/simple;
	bh=/AICuKrN+IrX6QtB2SnPbOfWHohj5aPu9RfywaCzoM4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lOErASeffyxymBkmUjvZAP5T8Kw3Z6+EeReLMlSjqXiHWsCR+Cc1/8xtDHB1z4rrNB2oqfr4x9eRTN00xIwgRkOwcQ6k8BvSQykQeK4nMJUOxoEz6JH+1ahyoAsqvJuBxvPvrgVvIPwonNoAZh+m4E8yYqDCYDHiB14prqkuUPg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=MEtGfSK+; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="MEtGfSK+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1760344046;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/AICuKrN+IrX6QtB2SnPbOfWHohj5aPu9RfywaCzoM4=;
	b=MEtGfSK+loywn+oChriNMVE/QhpwAsACv1C/Joeczdh6gXQYRm/cDKGWL4IsRUtx1t1Ch+
	361Ib7vfv7UrRquqy59/DpcOuZtq24aowUOqe4KFd+ZpZ9ew3UvqKa2Gi+sxmrQ8YkPia4
	QUGWJk4/BtvMP/JdTXbmsmidvZMo6kw=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-207-wNPTjIj0M_ufLDaH1Z-7BQ-1; Mon, 13 Oct 2025 04:27:25 -0400
X-MC-Unique: wNPTjIj0M_ufLDaH1Z-7BQ-1
X-Mimecast-MFC-AGG-ID: wNPTjIj0M_ufLDaH1Z-7BQ_1760344044
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-40cfb98eddbso2206901f8f.0
        for <tools@linux.kernel.org>; Mon, 13 Oct 2025 01:27:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760344044; x=1760948844;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/AICuKrN+IrX6QtB2SnPbOfWHohj5aPu9RfywaCzoM4=;
        b=XxIUf8P1Fb0SX74d1dkYYIX0dz4vHLS0LkWpD9jOxzbnCEtrSEwv0No0XpNgYwsXAU
         5SyrdDkUt2grIKBRI3+qlzqRZLY6xDhaEqUQGf6kqFboqTVp+hmGs93ogK3GFdUdOJXy
         /Rs7YeEH9ybIu4NC4RqGi6IeYaX6YSUZrArkF7cyK7Ilpt4wvlgpgtj4yASHnuHcq1Yu
         hVLZdy9nMxRkfG3hx+IY5vo6vt5fZtKR+ndF92DvEUXCLZG0MRTKJ9Aap0waUQaIvYYF
         CgxOWiKnUoySGjlWyAi3P6DOU2sekoLKnDvzzOwKepPiGgufBhARNIonu9A6wncwGbRJ
         q4ow==
X-Forwarded-Encrypted: i=1; AJvYcCUdqJim8lkJ93fNL4gQtFja23wcziZ7p80fBxHu+pm7fig2tQhdjwwdCTJ1QTtHWm10abcYag==@linux.kernel.org
X-Gm-Message-State: AOJu0Ywpvap5HIvTjjukgnZGbgWCqTZSUqj85WGbAAmERg9UGO7uo6cK
	gkeroYUvngznL4Wtcqq04pBLx8nDK+ORhqbELNS6WNLyAM0kmMy+GZv85I3zy5XD14SikDk6Ubz
	OR7pNUDtkqDq5gRIzOvE/Q4/f6wXYhaz9x/p4IyCpFElS5yqHDiD9oyD0xq7jNt95mJJRRN8Znf
	xP00CRP88ZimV5gw4OORnUnZ7iswkevBGo
X-Gm-Gg: ASbGncuIMgt6Z3epDvmO7aCIJAwaW/Gff2rbJULc3sKw13x6PR63nNOfBgGpX9Yzf9P
	Iqmle+r+Bhl7Rgm9bchLemljPlMdtIkGEal6QBti/rp8rqxFYL6kAGH200f0guW1YceZxTdmpge
	UqZH1jbauPamNNtW0VWf4KVDTiQ0tvoTGYZgcBooGiCCSUCtbMm7HGPhBPy7GNDL9tKh6SICuOt
	UGfnAktC2Yf57fFA+gCATrn
X-Received: by 2002:a05:6000:288f:b0:425:58d0:483a with SMTP id ffacd0b85a97d-425829a5a12mr17265207f8f.3.1760344044040;
        Mon, 13 Oct 2025 01:27:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH9uKnPgBMsxg//HcUmnsqJb2r/BARRyrN4tRqmx+Ng8Xb+bxdva1QlyaXpIfDvW2Y+hhO7a2BSH4EXi28Md+U=
X-Received: by 2002:a05:6000:288f:b0:425:58d0:483a with SMTP id
 ffacd0b85a97d-425829a5a12mr17265182f8f.3.1760344043648; Mon, 13 Oct 2025
 01:27:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
References: <CABgObfY5agTRsB-bCqCYbA0erFn5cVbujtTNBiCti8g_68nCWg@mail.gmail.com>
 <20251011061351.GB23024@1wt.eu> <aOoyhUzNDgwiyl5s@finisterre.sirena.org.uk>
 <20251012232725.GC3938986@ziepe.ca> <d884ec6d-856c-4dce-b8bf-cb6116c87bcb@kernel.org>
In-Reply-To: <d884ec6d-856c-4dce-b8bf-cb6116c87bcb@kernel.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Mon, 13 Oct 2025 10:27:09 +0200
X-Gm-Features: AS18NWABtaoydfFwWAW8ghVLzUK91oJC0I8Gt9OKGGT2Tdmgb4Yf26I4LqhGo-w
Message-ID: <CABgObfaL1Pki1QCgO_vb1Ex_1=RgVwzOmD8Z+q_KnPw3jHwBpQ@mail.gmail.com>
Subject: Re: In defense of Link (was Re: [b4] initial "b4 dig" to supplant
 Link: trailers)
To: "Vlastimil Babka (SUSE)" <vbabka@kernel.org>
Cc: Jason Gunthorpe <jgg@ziepe.ca>, Mark Brown <broonie@kernel.org>, Willy Tarreau <w@1wt.eu>, 
	Konstantin Ryabitsev <konstantin@linuxfoundation.org>, users@kernel.org, tools@linux.kernel.org
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: ttI1tS7lP1JafWMLElRfdBnwB7FXfxlRcOHK7Wl6O0k_1760344044
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 13, 2025 at 10:24=E2=80=AFAM Vlastimil Babka (SUSE)
<vbabka@kernel.org> wrote:
> That's all nice and everything Jason, but Linus has been very clear on th=
is,
> so it's just beating a dead horse now.

My problem isn't with dropping Link, it's with not having a
replacement and messing up the workflow of >1 people. I'm not calling
for civil disobedience or anything :) but it's not like Linus hasn't
ever been wrong.

Anyhow, since at least Greg confirmed that my stable maintainer
persona wasn't completely off base, I'll reply to the thread that
Jirka pointed out.

Thanks,

Paolo

