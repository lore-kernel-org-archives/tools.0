Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D46E3296BD4
	for <tools@linux.kernel.org>; Tue, 14 Oct 2025 16:56:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760460985; cv=none; b=X1VcFHBEDGQpmoSEcPr68zw2jN83/ZXIoJwUfej3+EOzF4tS6cWxwrQgWLHH7oI23CfLSa719+luFQVnCsKA1Q9f+BmfUmQpiYa4byIDVNxry3pAezAZBdu3AWcgtUo9CQXsAE7n21eCwMS94YPlqXFa1GGQ08BUZ4c8A8N4VP8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760460985; c=relaxed/simple;
	bh=hyoWY5mkM5hvRF1uIrvIKtl0nrbQ7keCnLp+7IS5z1M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=U5tgnTtMTGpU5+4BDx/ptUj0YnAGHzrQuYlwDzB4RFBKnVRKGkM2PDVOg8VmOk52KaXLMN3LVSPuasDldA+wjNaTl5LoUkxaYeablP0fDKUsLgqyFVe1GpJozIsfTkzcdUW4VjJDviwenjr2g5l3WmQ2WmiDhs5jE08nAroYuWQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=QBliR7TQ; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="QBliR7TQ"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-6399706fd3cso8290272a12.2
        for <tools@linux.kernel.org>; Tue, 14 Oct 2025 09:56:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1760460981; x=1761065781; darn=linux.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=mUf5FfTp80t6xGh5RLtQtRly30ToPfNI+mSGFvZvfiw=;
        b=QBliR7TQKL1WsX+eK3NWovtqL42IISZTbXBrPCOoEoDWF7iEv+aA/SwxithP2/SWuS
         QmhEATKyIhX0ASypE1IYp21eDorR4NyT0aoIbRQXWpjfHJG3lHMCeCv3ec2zQfNmRj1y
         HZrEP96g/KA1NoiMQoc3PmX0xcOj2WDkbmkKI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760460981; x=1761065781;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mUf5FfTp80t6xGh5RLtQtRly30ToPfNI+mSGFvZvfiw=;
        b=T9ZV4WrN6nii0IPVeCkWQzd6xT5DHhtas+BCwMGHNrUtKKOz/awXeQexI13mDIF9l4
         hQ+sCMG2D6bprqYcLIvXcrHVoO/sBdh21GvAs+hRX//xRsNJlGzbVXmhijYZootpLTD4
         V3MWp1yY0sp8riQnOg7YzO5E05BHFgUacQ60wVgDV628MpmpknwPfVsrBOyjUlVt17FZ
         9mTZ44as8DtDIOZskYVcFBkl7Vz+ewWkARz4G9KOaGulk5GAiou67x5wPOmtfVR7ThhL
         u7LklkU1gG3IeXR3BkN6Xp1PjmEfHXU4RtQDBF2IeHlnrXBB8RT5/OXYhsCbeKxp/C93
         hKJg==
X-Forwarded-Encrypted: i=1; AJvYcCUZDY/HOyj2I/EnF4mQhe/ZQ24kVj7iY7E9ukGt3oTGsfo9wqWszdo4dP900VNwFjAxi+iapg==@linux.kernel.org
X-Gm-Message-State: AOJu0YzQIsB0yXoiS7OUMYrJlnO3WTwwj7dVugKpNs0oLHpI/9Spz2uK
	zRyBkPqHrTI00J7HWNETeCWx+JRI7MAc0AbFGq4rkhxJre45ArAfwBKbz7l5Kh+5nOOkOc+lLXZ
	R3XAw5K8=
X-Gm-Gg: ASbGnctONPXQru2CB9Db2UgwEQ0S4Km8auXL7qgvyRb7TFg5lYb7ZCze5VH1SSHlMc5
	jVbZeabMe9uNlhd7AcRRP+UkU5c9o/mijxniFKnNVqybt/TF62Ixa9JPmCYYKyDwUFwdZCiyPUX
	hWxy+RXF2ur/QnZzVLn8OtYOvHxBACSCRqeeJl7QqNfcqmz4CrEmJRaSjNImfTMmUOABw4Iu8m6
	hDhriesnlyZvW/4tmDbf84GVmzKwDQMAusHU5r/GtMJ3ICEne02u8+gftfqBNuq0gglpHonBxjq
	HBSD6XVaK9OuL3NUtD5NIDZG3sJZa4P3qU2hHINTRxhwV5sJWJME8LcSi09IOYyZmiXJaNqov0e
	y5WsrMylwVMmtN87k5u7IPclKsi9UTPkz/sAysFh0+01Y1VxIFw6f3JOHHLtXKg/WhCJYWVOeE7
	O8dv/GpNwt8XK+0w==
X-Google-Smtp-Source: AGHT+IFM1FOmXKBdpM6qpOwT/miT6Z62Onuz06F77KJeAswg0RTXGqtuyxZzvoHHPg4cIIcKQXHNmQ==
X-Received: by 2002:a05:6402:34d0:b0:638:74dc:cf78 with SMTP id 4fb4d7f45d1cf-639d5c75d9dmr22984371a12.34.1760460980792;
        Tue, 14 Oct 2025 09:56:20 -0700 (PDT)
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com. [209.85.218.43])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-63a52b0f358sm11431819a12.10.2025.10.14.09.56.19
        for <tools@linux.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Oct 2025 09:56:19 -0700 (PDT)
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-b3b27b50090so1037541366b.0
        for <tools@linux.kernel.org>; Tue, 14 Oct 2025 09:56:19 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVuDz+KXD4gCFqX5bAnMxU1P7jTmJwR85i7SzGC47/N18UHjUw2J6ZGdY/eZBeXR+BMCBfGvA==@linux.kernel.org
X-Received: by 2002:a17:907:6ea4:b0:b57:78fa:db61 with SMTP id
 a640c23a62f3a-b5778fae293mr1245424566b.52.1760460979513; Tue, 14 Oct 2025
 09:56:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
References: <CABgObfY5agTRsB-bCqCYbA0erFn5cVbujtTNBiCti8g_68nCWg@mail.gmail.com>
 <20251013081536-mutt-send-email-mst@kernel.org> <CAHk-=whSShtPG1_+02Cc4yDuEJxVqX=G8tAx0gW7UjA7cuBp-w@mail.gmail.com>
 <20251013190418-mutt-send-email-mst@kernel.org> <CAHk-=wjioLpTroP=5cUQsVmDb3BtKnn5QToBX9Qy2dv_VYTZ0w@mail.gmail.com>
 <20251014062426-mutt-send-email-mst@kernel.org>
In-Reply-To: <20251014062426-mutt-send-email-mst@kernel.org>
From: Linus Torvalds <torvalds@linuxfoundation.org>
Date: Tue, 14 Oct 2025 09:56:02 -0700
X-Gmail-Original-Message-ID: <CAHk-=wj1rRqLm0upJVx-EPR_rN8W37kKTgzUSONUbm74mJhwig@mail.gmail.com>
X-Gm-Features: AS18NWAyYFIecVVbB8SBJ6OERAfto-890V2LrTy0ZTYvhxRNMAjFj1FmQ1-bVqg
Message-ID: <CAHk-=wj1rRqLm0upJVx-EPR_rN8W37kKTgzUSONUbm74mJhwig@mail.gmail.com>
Subject: Re: In defense of Link (was Re: [b4] initial "b4 dig" to supplant
 Link: trailers)
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, 
	Konstantin Ryabitsev <konstantin@linuxfoundation.org>, users@kernel.org, tools@linux.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 14 Oct 2025 at 03:38, Michael S. Tsirkin <mst@redhat.com> wrote:
>
> What do you suggest then, if not reading all of commit log
> and also not looking at the date?

I think we're talking past each other.

I'm not saying that you shouldn't look at other things. I'm saying
that the patch being identical is the *primary* thing, and that
earlier submissions of the same patch are very much relevant.

So if you start filtering by the author date of a commit - even if
that does find you an exact match - I think you're filtering way too
much (at least by default).

Now, using some kind of fairly simple scoring algorithm that gives
higher relevance for things that match might be the best of all
worlds: show other matches for the patch, but maybe rank it higher
when it matches "better" (which would include things like the author
date matching the date of the email - always with the caveat that the
"Date:" might be either the one from the email headers, or from the
top of the body of the email).

But people who use non-git patch maintenance systems will often mess
up the author date completely, which is why I'd not want to make it
very important. Maybe that's non-git use is getting to be uncommon
these days (or maybe other patch management systems have just gotten
better at tracking dates).

The one date I think is worth actually special is the commit date -
and not as an exact match, but as a cut-off.

Not because that date is inherently very important, but simply because
assuming clocks aren't too much out of phase (and assuming people
don't play games), the commit date can be used as a cut-off for
causality. Emails that happened after that date are obviously not the
*cause* of the commit, and are more likely to be the effect (with
back-ports being one big case).

                Linus
