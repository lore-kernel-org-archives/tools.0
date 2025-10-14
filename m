Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C61BD2F7468
	for <tools@linux.kernel.org>; Tue, 14 Oct 2025 10:38:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760438294; cv=none; b=dwCuCe9e1AwEw4Sbz8cD4fv4lRsvEwA8S+GCdJjJwQKa11Q03uMICm2V8dUDcftDxoQjL10CmEHyprr9uZdItEuLFGF9A/CQCW6zL2aPFhefsG2wv9LWKx+m8adbGosER0WFbuhyjNHGIfWLmqEy/X3iqRVsAA0kCDnX/jlnbes=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760438294; c=relaxed/simple;
	bh=4Z1or6ouCSLl95/8STrTvSzUlDfJXqi/iy4D6GqTuto=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=Oi8ZKMm79iEC55TY/xl3Oudf0HhbUOgwMNMYwsJECIi3ZX0qH5wkZey+rk3EEcu50imWbKAAom7FF6yE1AlNmnODuRIXXSazfY7ree+De6xmfeaZDGRXJ7vszrBYJN28pm6wnL1rbXMNLDPRDHpdelYIAkEWFvbkehf+OGrZvpc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=glropEn6; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="glropEn6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1760438291;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=wiZQR8plt/XcnFRJtdBORUBRfxg0kfjT2mLI3OWCsvM=;
	b=glropEn6fKULKZqBtPUhI/ssEhVQ3A3TLyUI9bHTdCkBSVEbWejKIJ7q3Y7htKm1zzFbzN
	0zm+KbEi85fSV/UH5+4e1Brtk5DzJKZXJnYQOFlxGiBczsP5DsDY8yG2BJSNI1snJvjuiQ
	rU4Prxm7Qe4TWXpiyXHDb8GVn3o/G0g=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-484-AsIj4c4TOsig4qg8FTC8CA-1; Tue, 14 Oct 2025 06:38:10 -0400
X-MC-Unique: AsIj4c4TOsig4qg8FTC8CA-1
X-Mimecast-MFC-AGG-ID: AsIj4c4TOsig4qg8FTC8CA_1760438289
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-426d314d0deso2179056f8f.1
        for <tools@linux.kernel.org>; Tue, 14 Oct 2025 03:38:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760438289; x=1761043089;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wiZQR8plt/XcnFRJtdBORUBRfxg0kfjT2mLI3OWCsvM=;
        b=fhEMExXPz1OLFx1iVC2ShIeXtXupcKNuCgOFnBeXlQwH9/rE9tLkyw4V5pdRCTcNXs
         QBRA19pBQwszm/CF34XahXFEPQ+VpsF25vmlw8lHiRPCuLt18Fj/YsYKKeKF62zuVXr3
         MAZFXK5PSFV5flj8Sj1prFmj8bvsJeTXFllDrnYEz3lN4HIfoMQKySJ/iOmSKFTKSlG3
         qmfGodd4g2yML2vGUjbeOpCSVY5uihUuUpE+sJJCHryzm6BTJMpQxOuoidzWrjZ6RNBB
         EzW9yF8MRmR9liDPgDGEWUmLYqP7kGjSvvLL4I9H3oKeLFUbbB4s00j/2lp5eWvcAdbk
         618w==
X-Forwarded-Encrypted: i=1; AJvYcCXHw9ulrfhCjGlN+gu3oEdD8GuAoHR07/Vri9g2F4FzWmqtTvGhOmtT5Pu/niDv7/dehUW8Gw==@linux.kernel.org
X-Gm-Message-State: AOJu0YxliOxEfcCX9YLXcBm2pMM1DW4K/Vz+7JCrX+Akjp3w7VAVFdM+
	QZ4kE7aV19tKRwhXrlTgZ8veXaxdPpKXryAEgfhRid+UnVPAM6FhJ0cfqETdaND9Z4eabijKyJi
	F6KUQJvb4cqLFRpUdYbNRxoE+OnFUj15hYFK4QWE3epN8+K8OC/ScG2f8Rw==
X-Gm-Gg: ASbGnctQu8Id8iDUDdLm+o3t90lL8PPlw2HgUKlnobFvGh6Ygv0NLi3WS9kYZ5kr/yJ
	4r1st0UtiEHbu2WnSSjryhhF3pcWeM09YDGKKgGJdHCA3gkrkf9p65S3/jF4K87MMf6zPpiHJbB
	QP+LE2YlZeTlo2zcdISUB9XhpwsmGPW4ojpNUJnsVSl4HWpymOBfW/4LaPnRn5mQHZK5xE0a/bD
	OCjXldOPCNwcn1E+G7Y2W8szYNo2JIJqVD8QaqufPR4UOLZ3dhuUN53fiE4uJD/Cm4wAVTmUaOi
	qnKTiQKrim5BgLJmOlOMk+t7DulJfSBhTw==
X-Received: by 2002:a05:6000:2c0c:b0:405:3028:1bf0 with SMTP id ffacd0b85a97d-42666ac2d6dmr15247681f8f.10.1760438288646;
        Tue, 14 Oct 2025 03:38:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGf8ljoojBAATEGFno+HeMwiZ+vzYW6J079KOhpKMG13LOcF5bNSeNYq272S4zhV22RZw12vA==
X-Received: by 2002:a05:6000:2c0c:b0:405:3028:1bf0 with SMTP id ffacd0b85a97d-42666ac2d6dmr15247661f8f.10.1760438288140;
        Tue, 14 Oct 2025 03:38:08 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc0:152d:b200:2a90:8f13:7c1e:f479])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-426ce5e13b6sm22998529f8f.44.2025.10.14.03.38.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Oct 2025 03:38:07 -0700 (PDT)
Date: Tue, 14 Oct 2025 06:38:05 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Linus Torvalds <torvalds@linuxfoundation.org>
Cc: Paolo Bonzini <pbonzini@redhat.com>,
	Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
	users@kernel.org, tools@linux.kernel.org
Subject: Re: In defense of Link (was Re: [b4] initial "b4 dig" to supplant
 Link: trailers)
Message-ID: <20251014062426-mutt-send-email-mst@kernel.org>
References: <CABgObfY5agTRsB-bCqCYbA0erFn5cVbujtTNBiCti8g_68nCWg@mail.gmail.com>
 <20251013081536-mutt-send-email-mst@kernel.org>
 <CAHk-=whSShtPG1_+02Cc4yDuEJxVqX=G8tAx0gW7UjA7cuBp-w@mail.gmail.com>
 <20251013190418-mutt-send-email-mst@kernel.org>
 <CAHk-=wjioLpTroP=5cUQsVmDb3BtKnn5QToBX9Qy2dv_VYTZ0w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
In-Reply-To: <CAHk-=wjioLpTroP=5cUQsVmDb3BtKnn5QToBX9Qy2dv_VYTZ0w@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 4vNlsd3M0Eqx1v874w65TqQ6QKEYKXAbOwUVvt3P01A_1760438289
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Oct 13, 2025 at 06:23:49PM -0700, Linus Torvalds wrote:
> On Mon, 13 Oct 2025 at 16:09, Michael S. Tsirkin <mst@redhat.com> wrote:
> >
> > Well I for one would often ask the contributor to repost
> > modifying just the commit message.
> >
> > The only thing distinguishing posts then is the date?
> > Doesn't it seem somewhat fragile, to rely on date?
> 
> I wouldn't rely on date. That's the point. None of those emails are
> any special. Not the one that was applied, for one. Because if there
> are multipel; versions, the commentary on the *earlier* ones are
> likely as relevant - or *more* relevant - than the one that was
> applied.
> 
> The primary thing is the patch ID.

Hmm. Sorry that I'm being dense. But nowdays, e.g. the Fixes tag carries
*a lot* of weight, given how automation trusts it to know
where to backport the patch. And the description is critical because
stable maintainers trust it to make decisions on whether to backport
in the 1st place.

So let's say I have v2 applied and v1 had a different commit log but
same patch ID.  A contributor (or myself, if I forgot!) is wondering
whether I applied v2 or v1 with respect to v4 having the correct
commit log and v2 having a wrong one.

What do you suggest then, if not reading all of commit log
and also not looking at the date?

> And if you change the patch as you apply it, at that point *you*
> should point that out. And at that point, by all means say "original
> at XYZ, I changed it to do ABC".
>
> See? It's not that "Link" lines are bad. What is bad is *pointless*
> link lines that had no thought, were added by automation, and don't
> add any actual information.
> 
>             Linus

That part's clear.

-- 
MST

