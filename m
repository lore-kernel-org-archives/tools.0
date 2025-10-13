Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E297E2BE041
	for <tools@linux.kernel.org>; Mon, 13 Oct 2025 17:00:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760374824; cv=none; b=YR6zccFS17bouOEFABMPxdj1Y+Uh/FDpRfvLtSry5Am8agV4Z1dGOI+iiwjyiRFwCvquE0O8NXi8BPCa41O9VQwvqDnFPKvmtb8JTZneURz2y6BkdWjq3x9lA89i4wYdHLip6PLWy4Cwz7eUYZ3o5FdMB6mtvw1UZ8kb+ug+Vsw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760374824; c=relaxed/simple;
	bh=7I6+OCValPT48YHQuZjUvUURDP29F251zlggRo6RuiI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rmUqqaur1qs94NPKU90MjbQjXLxmcaylEPVBogMUtuaRXwjgsG3IKMAQ00zDImptvzKcWVrRnmr+G/3+tqxET/BJ2CO0QL3wAWwHaSqdZzBm/qxxMEqc61SZZJ86XEhIZ5yhQB9aXKXTgsrBVH/IBjWsCJprQWSu8Sxdrnz5+Jw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=BSDiPbas; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="BSDiPbas"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-b41870fef44so190489566b.3
        for <tools@linux.kernel.org>; Mon, 13 Oct 2025 10:00:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1760374820; x=1760979620; darn=linux.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=+J8uLNFfvNlC2lQT/giMNL3x3isExocTaQO6iImqM/o=;
        b=BSDiPbas2HfW+IFI0J/ndYXzIPYe1wKWCZlDVon5pyOTb+OYAcv8BMpSM+4gF0BWUE
         yqyu4rzvtChKcP1K7REAHL9HXUewh6TBXXqPqDgVjtbzoG75XLRSDmtQFOdmgSypEwLl
         qvB/alfnMzcsCBL+ZLKKLZJJ2LUGyy+ZgocpY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760374820; x=1760979620;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+J8uLNFfvNlC2lQT/giMNL3x3isExocTaQO6iImqM/o=;
        b=caPRW+x/LeMDkifoeiRrNjddaRGfQAbZgTFUbmB2OBf7NB9aVhqr8Xh171gcncKvcJ
         6YpXJp4Xpt/YJTmbsduuqziWOoUMq2Zw8D6VevD2TeG3fuuVe2SSldXbxN8wJBTF4Dlb
         bfx/2JJ2ErRrTpNzkV9BIob9CzIL65EV5OG1zb+humdEyUgRdBucDEbvka3WQemcs2n0
         qHkt3bIXGW8ssY6Lr6EAOr8FQn62bviWVAFQtorr2c5bxUyO2cGBXxG+/rVyv4vszRu5
         T3rN2dgVGs1XbVbnfd8DuGNF/QghSWGoa9Amdq1bIClazmY5Eu6SOJsUIzFev7AsunJZ
         G2kg==
X-Forwarded-Encrypted: i=1; AJvYcCWscctpr1krj9z153AApg3p5AabdzjD0wy9UxYkFOZ4klGhg5P82FvAwnCvxqMqD0AghnFpKA==@linux.kernel.org
X-Gm-Message-State: AOJu0YyYSCY5Mj1RTqBKObHx/o6XoF4VdWusEDQZJ4HCRh3FX6A28lEq
	8LKgnwloAGFujQKixcyd0Vi453H9PeJF3/yPCUVqFZ68QOwfYx9LBHbKmGuy1wQ75QmevbAj/zP
	4zvcgsbM=
X-Gm-Gg: ASbGncuxjHCnKz1qmAYJX+tCY8N2XUcG2rdRgmCaCGcFylSR6f6UG2VtdtGUHk2VkpE
	4zWvIX7kBFLZ8ov3gelkokUWjnJk8hrcnvT/Bdo5UdJwMFX0zHQ9JhqqObxED7iCF00R2taTv5z
	m2GRBfhyQcGpemicHuR+u19EryVNUkuRMUpWVt/uNHONPi3MnRkrlpXie87HId5JuyYcNgtr30Y
	LHh2r43OZTkrB1CDWYR/CD8933/a9+mseLe2cmYyGbc0Y7ZeXu3SMZiWRPuj4nxhhXuf4uI5ZbG
	4m20XqY7bKOVRgTQHMWEi7gzZhDIlTn4ZACHDYjL91uZGVgbOIKT1g2RV7p4hiNjDBwBh1JTqda
	fKSlCQloe1no3qpRQ7UP2GYLL5R4DLa+Es4f275gacGkW69PV01jnaZ3ZZooE3K57koiuIl/YH8
	iBYG5vDAzBFyQLsoye/nqckwcc
X-Google-Smtp-Source: AGHT+IETd53JOx6UmwmRE7p7Sh4N9IboLwxYg5o6CpIdv5749pmx8hoibFjbxwoKBJPVdyqjd9qirw==
X-Received: by 2002:a17:906:80c6:b0:b55:e023:5e79 with SMTP id a640c23a62f3a-b55e0235ef5mr1138308066b.51.1760374819784;
        Mon, 13 Oct 2025 10:00:19 -0700 (PDT)
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com. [209.85.208.52])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b55d8c12ce1sm956890166b.57.2025.10.13.10.00.19
        for <tools@linux.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Oct 2025 10:00:19 -0700 (PDT)
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-63963066fb0so9226672a12.3
        for <tools@linux.kernel.org>; Mon, 13 Oct 2025 10:00:19 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXz2nWFtgujpIwAXsx8y+FC/CmEEXiFJNMxkgoji8XZvozeTnEjqmUovXWvttdULp7OEYdBmg==@linux.kernel.org
X-Received: by 2002:a05:6402:27cd:b0:63a:35c:6ec4 with SMTP id
 4fb4d7f45d1cf-63a035c73cemr14537622a12.21.1760374818684; Mon, 13 Oct 2025
 10:00:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
References: <CABgObfY5agTRsB-bCqCYbA0erFn5cVbujtTNBiCti8g_68nCWg@mail.gmail.com>
 <20251013081536-mutt-send-email-mst@kernel.org>
In-Reply-To: <20251013081536-mutt-send-email-mst@kernel.org>
From: Linus Torvalds <torvalds@linuxfoundation.org>
Date: Mon, 13 Oct 2025 10:00:01 -0700
X-Gmail-Original-Message-ID: <CAHk-=whSShtPG1_+02Cc4yDuEJxVqX=G8tAx0gW7UjA7cuBp-w@mail.gmail.com>
X-Gm-Features: AS18NWCOf2KTMXQ7ZoszmK7edYlXXhBLSOmoVU1-KAveIdupSMxaMnaTeqNC15Q
Message-ID: <CAHk-=whSShtPG1_+02Cc4yDuEJxVqX=G8tAx0gW7UjA7cuBp-w@mail.gmail.com>
Subject: Re: In defense of Link (was Re: [b4] initial "b4 dig" to supplant
 Link: trailers)
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, 
	Konstantin Ryabitsev <konstantin@linuxfoundation.org>, users@kernel.org, tools@linux.kernel.org
Content-Type: text/plain; charset="UTF-8"

[ Jumping in randomly in the middle ]

On Mon, 13 Oct 2025 at 05:21, Michael S. Tsirkin <mst@redhat.com> wrote:
>
> On Sat, Oct 11, 2025 at 07:59:32AM +0200, Paolo Bonzini wrote:
> > Linus complained about Message-Id too in the past, but if Linus does
> > not like Link or Message-Id then fine, but can we please take into
> > account that he is quite obviously unique among kernel developers? ;)
>
> I missed where he complained about Message-Id btw.

My fundamental complaint is actually about the "mindless" part. And
that' entirely unrelated to whether you call it "Link", "Message-ID",
or anything else.

I object *strongly* to any random noise that doesn't add explicit
value. For example, the argument that "I want to see which of the
identical 17 submissions was used" I find completely pointless.

If you can already look things up by patch ID - and you can - then why
is it AT ALL relevant "which of the six identical patch submissions
was taken". They were the same patch.

I understand entirely that people tried out Konstantin's first "b4
dig" and then complained about "I didn't actually want to see the
stable re-submissions".

That's entirely understandable, but that was not some kind of argument
against that model, it was just a "oh, 'b4 dig' just didn't take that
into account".

But if that is fixed - and we literally had three different ways of
trivially fixing that issue - and you then get three versions of the
exact same patch because it was submitted three times, you

 (a) actually have *MORE* information, and potentially see what the
objections were in previous series

 (b) if you really just want one, add a "latest submission" kind of
flag to limit it to just the newest one (again, with the filtering out
of patches *newer* than the commit to avoid the stable backports)

And that's really my objection here. The thing I really really hate
about how people used "Link:" patches was that it was both mindless
and pointless.

I have no objections to *mindful* use of Link patches.

The workflow that Steven Rostedt explains with multiple versions that
are explicitly linked together is fine: if you have real mindful use
of a "Link", then go on using it, IF YOU THINK ABOUT IT, and didn't
just mindlessly automate it.

So the thing you link to had better have some real extra information in it.

But if it's automated and mindless and you're not thinking about it,
it damn well remains wrong whether the "Link" part is renamed or not.

Because we *HAVE* automated information that is already sufficient.
Every single commit already fundamentally has sufficient information
to find the submission if it was to a lore-tracked mailing list:

 - patch ID

 - commit date

 - subject line and patch date (note: maybe from the email, maybe in
the body of the email)

 - author name and email (note again: might be the email 'from', but
might well be the 'body of the email' From: line)

and all of those are important information that any valid git workflow
*already* saves off because they are important and relevant
information ON THEIR OWN.

And they are more than sufficient to find the original patch
submissions, in ways that "Link" does not improve on.

I argue that "Link" makes everything worse. It does not add
information. It adds redundant data (explicit difference between
"information" and "data"), and not in a good way.

What's the real argument against "b4 dig"?

               Linus
