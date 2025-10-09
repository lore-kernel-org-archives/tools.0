Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 859FE2853FD
	for <tools@linux.kernel.org>; Thu,  9 Oct 2025 22:22:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760048562; cv=none; b=FJ4YKD7GHas2DrSk75DrI72kUru/R5eyadC1rYsYNuu34qpqRNMzEwerIz9/rIbRLb+PID869IjhV2dIxueNA+wQnwxQx0s7yez7+ErpKX2ZA1STptoxaGN4hapSouuZ/Ary5LcL2urmWnMsO1kEyM0wmrR9t3el/OZJKC2tR40=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760048562; c=relaxed/simple;
	bh=2RcoP7jtUYL+kDuDJJI53pfdGs+5ELPZzeIr2uIkvCU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mJYivoHaiGZTT1KAb9/QCSOukexf+x1na7hj+4iepyYcqP4T0SR34PczArGCj/LNCdhWhNN6sS916IX8YhBOQxZbShoQIRPtfcucRcyMol5rBgjvQq4JEj+wEgBp3MoV7gY8MRYCkNDithaCMO3B4UusoQiaXE1cxWDstMTtpAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JgZYod+y; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JgZYod+y"
Received: by smtp.kernel.org (Postfix)
	id 2F584C4CEFE; Thu,  9 Oct 2025 22:22:42 +0000 (UTC)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 65E65C4CEE7
	for <tools@kernel.org>; Thu,  9 Oct 2025 22:22:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 65E65C4CEE7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-b3b3a6f4dd4so267781666b.0
        for <tools@kernel.org>; Thu, 09 Oct 2025 15:22:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760048560; x=1760653360; darn=kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wq+cMkHHdl5BrpW1hDIVvgnTTiuNWMGWvwsQt1CevAI=;
        b=JgZYod+y4FWBnTS47RepmnlgmU1wt8DdOyqwWI2hPsPiazmdMqqwKjLgtiYrhsVaAW
         yD42WBl1UTekDpe/CskYT/doUYjnI164bqsKJambWfNArrA1m0Bv+oOp9JY77lh/JgPw
         wVMPOByd5dpKlPGLJ3nb6+5UZ9M9Z6NjDUaiHUmUhvSx7TXC31foCMOuwm9oiaqWuFqw
         ypF9zbAJBl8jDG1VDC8Swe8OUtlPktZh2N3p7+lKknVkWcKVXdWYnR7oPF4D4ANdwhVY
         sBNp2DiOt8kpmjFgvvF8qrxnoeaGuHDxGDq83Hm/+gKZ/tOdyxzaEfBzsXxrDFJuspxu
         QmYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760048560; x=1760653360;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wq+cMkHHdl5BrpW1hDIVvgnTTiuNWMGWvwsQt1CevAI=;
        b=MbzivDe4x1h3UxuvT04bHsYmMRnDUORqqPQPYyyWppMc4FeNnoNO7RlW7Eylo6LX/C
         A+eCYGc6mqSqkZoWmtic/UEAp6Obhaf3VqDvvma1N83fPM7QkPfJQR/VWNWqrD4/VuVZ
         Cb9oXOChi9rXdf1OoKJK1piIaaytcK5wgnbh2a2OlaxHZTcldgOHPZ6d2cNApFsEAjxU
         z1QfoIAjdPq449sydsaZPziUDjMO4MRbfjCKPC3q8WqENvaEZSA+1tUjGxLMHMeKd0hP
         Z/ogzMOQqr7Qrf8/pt6xRqdyZWrJ1sLM0yPTI3puCyYZuYQSTiunFLXxVbFEX0JkXgAW
         sZyQ==
X-Forwarded-Encrypted: i=1; AJvYcCWQQojFkXFfN40sdREPJ2N8UxCL1C8GMVfTQBE/TAgh3JwSQb0MzIWt/HHDYdlM+r3hs96u7Q==@kernel.org
X-Gm-Message-State: AOJu0Yx0Ita6weQL7JjzXeUpufC5uUa1eQyKxRCjQws4kCenlM2YI/UQ
	bYnkNht/N8JXhXsaWj4K11oHoDreNhbIYTobG/6HTsQuFgjg8Xw84kFdm3HBMbZUOFLUTRblsOe
	bI8ZnWQYBQS43oX8MLfaoMqSIFkm4Kg==
X-Gm-Gg: ASbGncuvCXILFJvg08arefTbJWG9C7got+4GinVFV2DYVxBhLEFaHPHqHpTyqbXoGly
	yomy9HBSvu1lr7lYHRLq2O1qneoTLJNVe0jR1VKGIVKteeWRMS9TCaxQIw4u1Famp/pzMoM5eOT
	MjRmxEuwxWKbEW50Vb23KdEpt7tYTDDCHKBk8JIhqHH8YKfxGB/1oV8DSTC/wYzJm9Vo37O5+xN
	MzK8qQZG4IZoQqUBRWXoHXmoQFkc/XghNxVLVfBCvsxAeK2iW7fMgoEsrnqekygteF8wFQ2+vxs
	1kFd9yS2aw==
X-Google-Smtp-Source: AGHT+IFLWToVkbp2P00UDxA0FKoROnkTZq1FLXofYVMsqNxef6PlHuAnJG2bIi/vsp+pnOh9hNNV5Uuhd9nXXPFXt/8=
X-Received: by 2002:a17:907:7e82:b0:b41:c892:2c6e with SMTP id
 a640c23a62f3a-b50ac7e6c8emr1027424066b.43.1760048559601; Thu, 09 Oct 2025
 15:22:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
References: <CAL_JsqLLOnpAHM38Bv05JdC1o0rS6eUG6WXgPHfnChs2n+AuWg@mail.gmail.com>
 <20250930-b219672c2-c7e4ae042365@bugzilla.kernel.org> <CAL_Jsq+Jxxyo=A9DtywQShk-LJ6x5QjwJ1D5+5-Y5CdYk--Ynw@mail.gmail.com>
 <20251009-amorphous-origami-cricket-199fcb@lemur>
In-Reply-To: <20251009-amorphous-origami-cricket-199fcb@lemur>
From: Rob Herring <robherring2@gmail.com>
Date: Thu, 9 Oct 2025 17:22:28 -0500
X-Gm-Features: AS18NWAETu9yRawnYUHf5j-MYiMP5hPl4b38njtdaYU_cEeSof8lYmxEUvWLEDI
Message-ID: <CAL_JsqLu_X6KQn--++8HMm-T8MEZZ3oT67KXE3Syzgi5bcEocA@mail.gmail.com>
Subject: Re: b4 shazam base-commit handling
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: Konstantin Ryabitsev via Bugspray Bot <bugbot@kernel.org>, tools@linux.kernel.org, tools@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 9, 2025 at 5:14=E2=80=AFPM Konstantin Ryabitsev
<konstantin@linuxfoundation.org> wrote:
>
> On Thu, Oct 09, 2025 at 10:36:59AM -0500, Rob Herring wrote:
> > > This is now fixed in 8c0f498752924b3d8ae9ee12bfdc2471c6e64515, but I =
forgot to tag this bug. I'll also backport it to stable-0.14.y.
> >
> > This broke some of my scripts. That's due to my parsing of the b4
> > output to get the base commit which changed. I can just fix it, but
> > that's obviously fragile. So what's a better solution?
>
> Would it help if we had something like `b4 am --show-info <msgid>` that w=
ould
> just output details about the series in a column format, like:
>
>     $ b4 am --show-info foo@bar.baz
>     cover-subject: Apply something to something
>     change-id: some-change-id
>     base-commit: abcde...
>     patches: 10
>     author: Some Dev <somedev@example.com>
>
> etc?

Yeah, that would be fine as then I can just checkout FETCH_HEAD-10.

Rob
