Received: from mail-io1-f48.google.com (mail-io1-f48.google.com [209.85.166.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3187C33E9
	for <tools@linux.kernel.org>; Thu, 24 Nov 2022 20:30:17 +0000 (UTC)
Received: by mail-io1-f48.google.com with SMTP id e189so1850451iof.1
        for <tools@linux.kernel.org>; Thu, 24 Nov 2022 12:30:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=FtLNh8A6iJxrm9ohpNMtRqvx9GLgr+qSTKx1POX8ruM=;
        b=CBvi1wX/m0DJwm7kLRaVianrGIEMmmVtQ5cDliHK6DUOsSPxlxES64axUDR9JiByII
         bPiiUd6sYoKpA7EdvvytXlXhd3f3iuCaQAX6Y5R7PikpByTH0fQd99Tbhy1trgQUeOlA
         7OKvAwCMMzpouwnrUg0WUtE/u7HkQNa6P9K3k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FtLNh8A6iJxrm9ohpNMtRqvx9GLgr+qSTKx1POX8ruM=;
        b=C5c4hX5cfs39J1eFkzRhxARMU+5OyyDVDm4KpPD61X2PXSa467XOxrNbmIXFOoJBe8
         axi1Ia+R2l/C3+woS45fYvkaAWNySzYdXoObcK0iBat34N23R2BJPkRodo/O02H+72HH
         IZexe0X3I8MCQcyLQv9NUFXsnLq3q96pjT9oVngA+yvJ+F1PCfn+l5yqrsN6/6eVaPm/
         aYtwpyT4sZ/CedSI9eFU0KU6NCSC3dnohLiUH2Uj1WvleG112PGjXw+K/erybXMVV2/1
         CsCj1MuH5aP2LVwTe70fG7hhaml2xZdmAWDBb6S9bzbz1H2kPpdOrGRyguJcryTU3mab
         R6oQ==
X-Gm-Message-State: ANoB5pn9GXy9vn7i1ccaS7024ZmN4YQT6YvppgYv3jSzKvFd4mxs6tr9
	+tYlPzCpRHZDXCUXLnZF+3fd1a53JvJAzqmw
X-Google-Smtp-Source: AA0mqf6Glho40TLQDgKf+wtXVydvzAtF4vYvPH0ifpVkLgOol70H4bDqSLJ7oXuPQ+si6UYBaC6M1g==
X-Received: by 2002:a02:8585:0:b0:375:1b24:2382 with SMTP id d5-20020a028585000000b003751b242382mr6979517jai.308.1669321816036;
        Thu, 24 Nov 2022 12:30:16 -0800 (PST)
Received: from mail-io1-f48.google.com (mail-io1-f48.google.com. [209.85.166.48])
        by smtp.gmail.com with ESMTPSA id w184-20020a025dc1000000b003752e5b3c23sm735752jaa.20.2022.11.24.12.30.15
        for <tools@linux.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Nov 2022 12:30:15 -0800 (PST)
Received: by mail-io1-f48.google.com with SMTP id g26so1178302iob.11
        for <tools@linux.kernel.org>; Thu, 24 Nov 2022 12:30:15 -0800 (PST)
X-Received: by 2002:a02:c897:0:b0:374:100a:b0c7 with SMTP id
 m23-20020a02c897000000b00374100ab0c7mr7187422jao.185.1669321814806; Thu, 24
 Nov 2022 12:30:14 -0800 (PST)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
References: <CANiDSCs-_bM6kC0cYTCRjCha3n0QVhbC+tTt=N9G4QPwgq3s+g@mail.gmail.com>
 <20221124202437.td63ug6zmbeka4xj@meerkat.local>
In-Reply-To: <20221124202437.td63ug6zmbeka4xj@meerkat.local>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Thu, 24 Nov 2022 21:30:03 +0100
X-Gmail-Original-Message-ID: <CANiDSCtZhcBw60gBLjxzoObCjt0V--Vx17roCRC1G=Nb+ttzyw@mail.gmail.com>
Message-ID: <CANiDSCtZhcBw60gBLjxzoObCjt0V--Vx17roCRC1G=Nb+ttzyw@mail.gmail.com>
Subject: Re: b4 prep/send: single patch mode
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: tools@linux.kernel.org, Mark Brown <broonie@kernel.org>
Content-Type: text/plain; charset="UTF-8"

Awesome, thanks!

Sorry for the noise :)

On Thu, 24 Nov 2022 at 21:24, Konstantin Ryabitsev
<konstantin@linuxfoundation.org> wrote:
>
> On Thu, Nov 24, 2022 at 06:49:34PM +0100, Ricardo Ribalda wrote:
> > Hi
> >
> > I have moved all my developer workflow to b4 and I am super happy,
> > thanks for that :)
>
> Excellent!
>
> > There is one caveat though ;):
> >
> > When I have to send a patchset with only one patch it seems redundant
> > to send a cover letter, Most of the time, it is a copy of the commit
> > message at 1/1 plus a link to the previous version of the patch in
> > lore.
> >
> > Would it make sense to add that info after the --- and do not send the
> > cover-letter if there is only one patch on the set?
>
> This has been possible since commit 6c215d83473d732cf1208c17a00a8ebc7d7526eb
> -- you should update to the latest master (or at least to the latest
> stable-0.10.y).
>
> -K



-- 
Ricardo Ribalda
