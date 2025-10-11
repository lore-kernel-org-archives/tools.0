Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7DFF1386C9
	for <tools@linux.kernel.org>; Sat, 11 Oct 2025 20:08:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760213339; cv=none; b=i8Bx2j9NKGkyMbu3O0L+dKMxiHkJ3If0iM1Yo6oxXOv3u+F/8hkcM+achnd41ctg1+VSSuwJDDk0+jVuR5JoqPlwmBeqeutVxNbiKGMUBCwKfkVxlUM9U6S8GhNeY6sP678QVurxwtoke46gPN7yRCLPHeYsejxXPeJtMXz9TUM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760213339; c=relaxed/simple;
	bh=Vqv2AOSt36KDWaU+moh9ceHv1H6JChuL3eu+wvCFT4U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qpIruygFCbnjivFhZ9kS6xmBunUvUIqoDAACggIJyZwSdRfWL94zEnMBXfIiH8iM0+ZRyuwiQGydNkZGxPFbs4jgfTtbTwK0a6kKMQm4hEAHSHPYXdudU5fMuXmoYoP5egq3Zdd2IKa9+/SJaqKW/0Te6C84p92fTWyoFz7SlKA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix)
	id 94AAAC4CEF4; Sat, 11 Oct 2025 20:08:59 +0000 (UTC)
Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com [209.85.221.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 58147C4CEFE
	for <tools@kernel.org>; Sat, 11 Oct 2025 20:08:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 58147C4CEFE
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f179.google.com with SMTP id 71dfb90a1353d-54c0bac7d6bso1199791e0c.0
        for <tools@kernel.org>; Sat, 11 Oct 2025 13:08:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760213337; x=1760818137;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Vrbmkm0Ow/iUbR2Ku+ZmZgIBHxRRj/eyb4GsBieLn2k=;
        b=nXi/ckd2L0DFjDM1jcHoUAz8MIyOanhzkbWrDYRU2YUjQiajECJhi19xw61N8WaHc6
         xBNuLVTAxW8AAF9pwBPytmp2iCtiVc3uevLBfvm0UMI/TVqx39uF/iIwwhYePCQRAaR6
         rSgQ+Ps24rM5IDV0a9/uMjuZ1FnIO2D0uPU8asmTGrRg/LHY0aFVHUMr8b+MHGN3geVs
         QfvGVk8L+/TxNULV1HQTrOEh/HV2i+imhIjU+bQzCiDeW14JNWQVKh4Ck/NDch7o1jtQ
         2glUUQ5hVrvL2qtYXLNZuE+PPMKpAwOv1fMWS01TLLHenRZxDcWSHGNUAhw7y4wt3aHI
         18ug==
X-Forwarded-Encrypted: i=1; AJvYcCV0iqcvlzCOBLKl5vM+ttGYO3In6rEnsEZvqfXTYm12bj3TgMkjvhXv8TL5YSDNGB903o9aAQ==@kernel.org
X-Gm-Message-State: AOJu0YxGGSLGVj42xs0ywRKfmZRrGlD5CHDOJ60WZzM0r9nfie9nYSPR
	K9xwp8D85A+UPWjFxH1At94xlhCtDQPVCbi9rGePdwoDEn5bfRD3mTj5fbfMHBB+
X-Gm-Gg: ASbGncugeB92bJTMLsnLH3XRf9ck8qi/tp6mrRcItGXR8GJZp3wg0AlQ4D6Gygt/iUl
	XgApuGyCq6h1cx7lVbf7rrD+tMVotrrnwOKlaKY3b6qN1fyL8YpRjHf2PXdywbGgjozL9Cu9arM
	L5j0nUHgEQ5E8CrBHlzVlIgYWKGJLEnjv2HHuNdB3yg7OREFHunO20w+PnOY6xxgN87jtg6MA4S
	0EF1h8LT2TvPfVEMdXsF2podAmmgsl4fS23Mn06kgR9NI/qK6s1O+Idoywb/OOA+mkOt1Qtng4t
	7WdiHivaxKYeN2AiI1gPbD3FR+2MldRWMYgZDpgYnVXh4bLqZs3lOTTPofyxL1acG4pCNNWwrY8
	zephfCT2y4wtOzM/pwkksS9WkrEraS1CNPbSUIg5Ox6Rxg0ulucA0QPBDdRTt7KT0ZUfYCEYRlv
	/utfHQwzTHjtNbtYguZg==
X-Google-Smtp-Source: AGHT+IFbogmQsr+Hpeyt0ihAq7KoN0IVQ3GbFB9xUA2B1sFd+DB1SZm4Q0xLHXQMkG19qFC9KoJk2w==
X-Received: by 2002:a05:6122:885:b0:54c:6e3:88 with SMTP id 71dfb90a1353d-554b8aaa083mr7561184e0c.4.1760213336752;
        Sat, 11 Oct 2025 13:08:56 -0700 (PDT)
Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com. [209.85.217.42])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-554d7ecf4a4sm1770255e0c.3.2025.10.11.13.08.56
        for <tools@kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 11 Oct 2025 13:08:56 -0700 (PDT)
Received: by mail-vs1-f42.google.com with SMTP id ada2fe7eead31-5d28f9b4c8cso2603480137.2
        for <tools@kernel.org>; Sat, 11 Oct 2025 13:08:56 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXziyNM+sNVUU12MewGNcySSquQthPgRS7Uh07vmWmTci7N+Z07M7Vg02gO9OgoIwMOvVOu6g==@kernel.org
X-Received: by 2002:a05:6102:f0e:b0:529:b446:1749 with SMTP id
 ada2fe7eead31-5d5e225a0e9mr6890742137.15.1760213336284; Sat, 11 Oct 2025
 13:08:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
References: <20251010-muscular-camel-of-acumen-00eeaf@lemur>
In-Reply-To: <20251010-muscular-camel-of-acumen-00eeaf@lemur>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Sat, 11 Oct 2025 22:08:45 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWthGyaGSFL-JhF=tQ=bZe4Q2DdgDijKPAhTBmOOMTrjA@mail.gmail.com>
X-Gm-Features: AS18NWCyc7T7Q9deQYjQZE7d1KKtI9j81W9MNXM0OlYtcNMIh01s1uXh0qy2_lw
Message-ID: <CAMuHMdWthGyaGSFL-JhF=tQ=bZe4Q2DdgDijKPAhTBmOOMTrjA@mail.gmail.com>
Subject: Re: [b4] initial "b4 dig" to supplant Link: trailers
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: users@kernel.org, tools@kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Konstantin,

On Fri, 10 Oct 2025 at 23:25, Konstantin Ryabitsev
<konstantin@linuxfoundation.org> wrote:
> I just committed the initial implementation of "b4 dig" that will hopefully
> make it easier for maintainers to figure out where a commit came from now that
> we're actively trying to phase out Link: trailers. For now, it only does
> "b4 dig -c [commitish]", e.g. taking some random commits from today:

Thanks for your work!

> Matching the exact patch-id:
>
>         $ b4 dig -c ce740955b238761ec1d8cf0590d7e6802d3a813a
>         Digging into commit ce740955b238761ec1d8cf0590d7e6802d3a813a
>         Attempting to match by exact patch-id...
>         Trying to find matching series by patch-id 469ebf2cf560b32106f206e389752deb5f741b6d
>         Grabbing search results from lore.kernel.org
>         Found matching series by patch-id
>         ---
>         This patch is present in the following series:
>         ---
>           v3: [PATCH v3] dt-bindings: bus: renesas-bsc: allow additional properties
>                   https://lore.kernel.org/r/20251009183630.5451-2-wsa+renesas@sang-engineering.com
>
> No match looking up by exact patch-id (and trying myers, then histogram, then
> patience algorithms with no success):
>
>         $ b4 dig -c a29ad21b988652dc60aa99c6d3b1e3d52dc69c30
>         Digging into commit a29ad21b988652dc60aa99c6d3b1e3d52dc69c30
>         Attempting to match by exact patch-id...
>         Trying to find matching series by patch-id abc964d5d53674450f7e553bbe031edc61ac3308
>         Grabbing search results from lore.kernel.org
>         Nothing matching that query.
>         Trying to find matching series by patch-id adf0918395a1a601a8d54d7d26446aadfb6101c2
>         Grabbing search results from lore.kernel.org
>         Nothing matching that query.
>         Attempting to match by author and subject...
>         Grabbing search results from lore.kernel.org

How expensive are these fuzzy look-ups? (Yes they must support fuzzy,
as lousy patches may come with lousy submission practices)
Do we really want to spend all those cycles on finding something
that could have been found easily if a simple Link:-tag pointing to
https://patch.msgid.link/ would have been (auto)added?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
