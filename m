Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1850E1ADC9F
	for <tools@linux.kernel.org>; Thu, 23 Jan 2025 20:29:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737664142; cv=none; b=bVnQ/zE6gkS7aZMAtjr8Wdm56iedHZgCrN34pKro3wRPGR7MuCx8u8FWKTWNn5EeViooGsHy+T4rR7KVNPWiKg83XoXEXlTKjezCe7CL9Wnm8nO4JlkD6WgOfztK0f8mwq4ZRlsP1FS+S2o4NImvaK0zUwYQZoXHYGgz68V9vrM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737664142; c=relaxed/simple;
	bh=jzH4Glonyk7WZQzB5Noa4Jd0lejew+7RHe/5G6ZMVxg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mg/bYWDR/LzbDXzXndJFXQYCo6/YWfd+qULdm2niyrq+p2V/Uz05gJFZ9wtPcpsb8vge3V3Hm7uEwbN4kAWYYn4xYHih5pBHPXmEGRlHGz6D9IbE4BmQ0zmATMQhppd+LDJf0bjsmWeqy/NWtK06N8ulfYPhAw/ZWOzv4lfKkkA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VRe5h61I; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VRe5h61I"
Received: by smtp.kernel.org (Postfix)
	id F3C4CC4CEDF; Thu, 23 Jan 2025 20:29:01 +0000 (UTC)
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id F4004C4CED3
	for <tools@kernel.org>; Thu, 23 Jan 2025 20:29:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org F4004C4CED3
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5401d3ea5a1so1291850e87.3
        for <tools@kernel.org>; Thu, 23 Jan 2025 12:29:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737664139; x=1738268939; darn=kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jzH4Glonyk7WZQzB5Noa4Jd0lejew+7RHe/5G6ZMVxg=;
        b=VRe5h61I3JbqOWeNIItQogx4N7D/h8Fh0EoINdYNsyowbA2kIl5M58XNIOEqsbZMHQ
         DbwlD5YNtZNHZzENopsv3bCzdE+HTFoAm5KNEVl1jS5K9FzBPZkW0oknUngXZC3D2gq/
         9MjHon0zHDb2/XBWXhkNkHHTvnBzTQh1+Kz6xx849G0qm+Jp6eckCRG4okzlDgaWdGNB
         UGAQPP/b7ZVezFd0KTPYnnX2mTvVkUqv2dCS+Ty7RQofUMPbMz3S1mt1+dc8xiZxF/0h
         R4l7/06mqvLiY5iUyF4r/qwUEyEzHH1rvUBbeXnScgq42+l5yrq/vdF+8AvVqDFJUW88
         Nfxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737664139; x=1738268939;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jzH4Glonyk7WZQzB5Noa4Jd0lejew+7RHe/5G6ZMVxg=;
        b=UVO6incojRdqutqqwuFkafE64BJd0a7dGiWN7CgtYVMiPw1X6KL1FuzpSXKYfjwOE9
         WdC6+JCtCje6CzfCmsyPdO0PdceyOxIlfMiWHhjoKvoLO4wO+9cjT9BZZrp56MFlCOXz
         KmX/bhiQrIZGVVo9KdYgfFTXjWgpZeYVyIrI/+pooNi56HlDuUDwIfoI2PkzChlG6SFc
         uig1CsJAK2+ueSLwNq1zYytMD0i+c5URRXczkolj84imFodVuBTgbIXZkPVY2AtbLt0h
         Tfv9Lty/CNGM0f1lGLsjjHvJu0gLQLVOLRcaCR5QRpF0QjTpQbxAQRVwSZnHy6i8X2UI
         tyVQ==
X-Gm-Message-State: AOJu0YzAPq2dgb+NLtfFsvN40NFHa7fsb2QKKM1Eb06mkVFNIZ1TUMdV
	P8ldPIYMDyaxJCnWXztC53oOhHrkZYvvsJWRf5AcspSzUTNPYSz2zXa2vEQntMaEEi9AQl/ZLBl
	4JpMTE90G0ZNHWWgDup9lW6m4AwRjKzJiSKQ=
X-Gm-Gg: ASbGncsdhrltP4Bzl9sqe5QMYU48tV1U//xeQ+kQnP6Cd3Xt379yxoCf4lHBql8CoNf
	PM4RNrU8bHjEUKVNBs+lZfB020NmZ6ZAntSxh7PEtn6NbDE+Sz1O+CKlJc5zu5VI=
X-Google-Smtp-Source: AGHT+IEzqPKQu4fKskQmZ+UdM4R9KGhG2ZC00hZMST38cP7WnSnRwoC5X1cytstkJFmCyKCNvzozf0yp525jEfOgf0I=
X-Received: by 2002:ac2:4e0c:0:b0:542:28b4:23ad with SMTP id
 2adb3069b0e04-5439c241157mr11107458e87.16.1737664138540; Thu, 23 Jan 2025
 12:28:58 -0800 (PST)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
References: <20241025-better-type-annotations-v1-0-9d7a00a8d754@gmail.com>
 <173755972553.457666.16721877756658243086.b4-ty@linuxfoundation.org> <20250122-flawless-logical-badger-d760cb@lemur>
In-Reply-To: <20250122-flawless-logical-badger-d760cb@lemur>
From: Tamir Duberstein <tamird@gmail.com>
Date: Thu, 23 Jan 2025 22:28:21 +0200
X-Gm-Features: AWEUYZkFj52haIa5BSu5En8NhRnUICMFe0Cgr-1O9EPZMv8tEmhiRt3wVhbOtYg
Message-ID: <CAJ-ks9=D7vv=xq2hDeENGqzvujw+oye2=AUBBQtcu148szDoGA@mail.gmail.com>
Subject: Re: [PATCH b4 0/5] Resolve some static typing errors
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: "Kernel.org Tools" <tools@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 22, 2025 at 5:36=E2=80=AFPM Konstantin Ryabitsev
<konstantin@linuxfoundation.org> wrote:
>
> On Wed, Jan 22, 2025 at 10:28:45AM -0500, Konstantin Ryabitsev wrote:
> > > This series slightly improves the quality of type annotations in the
> > > project. It also adds development dependencies so they can more easil=
y
> > > be installed.
> > >
> > > Unfortunately this is only a drop in the bucket; there are still 356
> > > errors as reported by pyright. Without minimal tooling to ensure thes=
e
> > > don't gress, progress will be difficult.
> > >
> > > [...]
> >
> > Applied, thanks!
>
> Note, that I had to do a follow-up fix for the missing Generator type imp=
ort.
> I should have caught that during review, but missed it.
>
> -K

Cheers, thanks for that.

Would you be interested in a Github Actions config that runs the
static analyzer? As I mentioned in the cover letter I think we'll want
a regression to stop so we can make steady progress. If you're open to
it, I'll work it up.

Thanks again for creating b4!

Tamir
