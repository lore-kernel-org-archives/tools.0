Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C264F26F29C
	for <tools@linux.kernel.org>; Thu,  6 Nov 2025 08:33:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762417989; cv=none; b=rE/8bL5bA+8QSWL24sOb2Az5MAcVmP7EPJCgjZ4rCQTvlRuQgMyvmDv5EwtdlhMuXW3Mgl/QwJSuYPDsGQy/pgJEX0XUXX2Of6+KP5p759+KRUZsm98Km08ofsawYFL7tceruuA0k+G2I/WyDkCLPz3NstoxKGlSstdFjOwqHpY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762417989; c=relaxed/simple;
	bh=MKTs0fHet4/XcPHSzwIaI14ZubP21X6bNZ8JTeA6G4M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ueOKifiEWOvR4eXv2SeyBaekgqboWNkh+q5Hi9E6vEZekCQp6gHGbyD1My4ATb4K7EtRQk1j2VbaxyQ2S+fP+9ngB04asVv5Yre1rMW1TZQnv5IGyOWKbzsv/qeODCJitAO3oHjNWUf8RszwAKP/vw2pAlwA+i7pKsgnrO8tkzc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix)
	id 6A28DC4CEF7; Thu,  6 Nov 2025 08:33:09 +0000 (UTC)
Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com [209.85.217.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 0C53FC4CEFB
	for <tools@kernel.org>; Thu,  6 Nov 2025 08:33:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 0C53FC4CEFB
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f47.google.com with SMTP id ada2fe7eead31-5d758dba570so338033137.2
        for <tools@kernel.org>; Thu, 06 Nov 2025 00:33:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762417985; x=1763022785;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UAj63J+kQfdR1osPA9Yq9jEFZQeXaP+LhbRLJ4nsg3k=;
        b=fxgdwHY6spwdoxcW+nSA8HhXx47lvpNz7hG8v0zyAs1rZWqYLFPSNo5ruFHeo2bwSd
         7IPbGSf6LFFcmMoi2Ec1/hhPbrkhGP0AxyqGuuHRPPNMWfzymOy5m2G/fb/k2s1HMC1p
         oi1npfVpLt1GH5IrajNVNhFSb4CgvRvjdiNC0O7W62WevUE6gbzpjcVd0WFivtDvi+Q2
         TuJaoxSmWzSWAH8L8qKEx/ZWKPlddMHnkuzmIZNqXweOLvEevouSixToB48P0B9tQV2d
         K1j2gMGLGD+g3Y2fY3ZuWuEq8taqNKbAv0xkwDhGHdAizcBjVMF3P5e6DnnLox0ZIz13
         nXGA==
X-Forwarded-Encrypted: i=1; AJvYcCXT6T//KMi7R/SJN4FjCVUYc4J1Ta70JwGBqzM7VQdnaAsEb8RVYLnt64YTGSuMsGn8UbJvnw==@kernel.org
X-Gm-Message-State: AOJu0Yx/YvS6zg3he+MTTwZQDAV46/FGbAzsGtL0ZLC1iPDTLZAwjQsm
	wZKEyVzkIKeOm17Dw42g39bvGDoWcPh8TQHLhELWVlcjW3Y+xK/f47HRUQOz7Xcs
X-Gm-Gg: ASbGncuR3L9jCPdzQRVZQ1wNCiVawJ6qrBUyJwscs7mccBgpxJvIDlFaetzRgy2jnvv
	5M+Pg0Nth8zJRwt9CUoGR6BdHwt53CfpmvcTwHaDYJthKodx6OWidrbYg1gqmkpegX6OvfdEajP
	E6fr4ZPmCVojgFSSqjvZl1RaxN1ecl5cj4d4cdo3jvLgGvArWSC/4nC8XCUYUlzjm/A7JPss5Po
	MTzNH64sehQFrgN2KSSwbgDYFAJGZtPMDEZf37r0lzJS1mySy79yQhQGbNEE1tocd6oGv77iMRa
	b2iHdN+B/qdaSpymgR51YIRxWr/8xyrqM1Ceau1PoTYz10NSd4UKO8ajTVYDq27xNtCB+2D5L/N
	fUfIuvbF+EUPYbV7VsDnHKH0o+8Er+lGgsBP7u/KVWM+XHA/rlzCixsdrMlzYa+Io33qveapxUu
	Lt6tKmFCu+bVLpS1Bj4Q1GUjh2GALAUkZllpyiow==
X-Google-Smtp-Source: AGHT+IHzxySKa793IOWAwfw6gmYaLyNe/fiTzwVVavcTL9YoEQKErVvjrgq40L1sBDq/DBoPVS8Y0w==
X-Received: by 2002:a05:6102:dd0:b0:5d7:e07f:d7e9 with SMTP id ada2fe7eead31-5dd891f4db3mr2031727137.23.1762417985372;
        Thu, 06 Nov 2025 00:33:05 -0800 (PST)
Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com. [209.85.222.47])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5dda2012d0esm766121137.9.2025.11.06.00.33.05
        for <tools@kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Nov 2025 00:33:05 -0800 (PST)
Received: by mail-ua1-f47.google.com with SMTP id a1e0cc1a2514c-89019079fbeso199943241.2
        for <tools@kernel.org>; Thu, 06 Nov 2025 00:33:05 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWna8BieN2ZlXTEoRJTTU+1PsPsLCX/4T1zjJBjKM3FlKDwd9JyBG16X6ZQY2bX/6AiLQOXHw==@kernel.org
X-Received: by 2002:a05:6102:1a17:10b0:5dd:8a21:3916 with SMTP id
 ada2fe7eead31-5dd8a213a65mr1545651137.12.1762417984897; Thu, 06 Nov 2025
 00:33:04 -0800 (PST)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
References: <20251105-mottled-bizarre-marmoset-b055ae@lemur> <CAHC9VhSkUP4P-2Q8AaZZ8VtY27tHEGaxvDwAzSx_4wwLFrqM9Q@mail.gmail.com>
In-Reply-To: <CAHC9VhSkUP4P-2Q8AaZZ8VtY27tHEGaxvDwAzSx_4wwLFrqM9Q@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 6 Nov 2025 09:32:54 +0100
X-Gmail-Original-Message-ID: <CAMuHMdW=x3vAMiZbVYNH0kXWe66xQxX6Bm=s1OuuCtL72zbe5w@mail.gmail.com>
X-Gm-Features: AWmQ_bmmRQmgAf8DyHpZj-BB9VhGHlw-JHSqnaux-YPg9U-mPVYdhiyZ-8_P-04
Message-ID: <CAMuHMdW=x3vAMiZbVYNH0kXWe66xQxX6Bm=s1OuuCtL72zbe5w@mail.gmail.com>
Subject: Re: korgalore: a tool to put lore/lei messages directly into gmail
To: Paul Moore <paul@paul-moore.com>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, users@kernel.org, tools@kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Paul,

On Wed, 5 Nov 2025 at 20:14, Paul Moore <paul@paul-moore.com> wrote:
> Often I don't want to subscribe, pull, or otherwise consume an entire
> list, but I do want to comment on a specific thread or patch.  With
> lore it is easy to read the discussion, but difficult to reply with
> gmail as there is no reply-to header support.  I have my own hacky way
> of handling this that I don't particularly love, but if I had simple
> tool that I could run, e.g. 'kgl pull -M <msgid>', which would import
> a specific message-id into my gmail inbox, I would be very happy.

You can also reply using git send-email.
Lore.kernel.org even tells you how to do that, but only when using
a URL that does not include "/T"...

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
