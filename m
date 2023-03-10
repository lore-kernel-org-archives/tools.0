Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82304DA9A
	for <tools@linux.kernel.org>; Fri, 10 Mar 2023 19:26:55 +0000 (UTC)
Received: by mail-qt1-f169.google.com with SMTP id d7so6880710qtr.12
        for <tools@linux.kernel.org>; Fri, 10 Mar 2023 11:26:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1678476414;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=fNAByfHHpFrjDqY99IOXUyToeyPLipH+DHMu2IMELIU=;
        b=FZUv1/KTVB2BMR++2OMbfabBDzOLzHXi5X5HVqLr+7XJ7xAYdC8R5+/blifW+mjSdA
         nx/N79lRcgMx4rW+FkFKhrw6WYfzVxdrbOLjzT7O8/+2NfN7aCAsgeaTRi4LZAB4KOqL
         kvAQGso4R1nNAvPPSmQ82lirC7qmr8Ynf00Ho=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678476414;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fNAByfHHpFrjDqY99IOXUyToeyPLipH+DHMu2IMELIU=;
        b=6A/Z27Y5ZZ62RtQsEvI7bLGY99BQXsu38/tF8dvezKR44bSpjnHgaceAyrYpfEHGdD
         8HHjxl2FrNd69/+sGt3SDfpnuPO40763kIbPl7s/wQYDUN8DN6IWW1vn66aX8RsO7Nzb
         irFhwq+mUpuEjEaakeXZ1Cb1d+C1tr7qKDtim4bK1RInv+buOWslX9kUAB93gg11SPdX
         dkvEqEhxT0cmZhJyAnpifNQOcqCfJCaysfFj8dkIyJab25mdSkOUHmosb8qFs4U8K6Lb
         Odpg77HNqNWmM/iTbjkw7tBFpwiIu7iG4g0VmJ9srq27BxdaMLz8rUwy1vrNzu+cM5SW
         KTmA==
X-Gm-Message-State: AO0yUKWbKRUmR3Za50kp2HV9cbfZbr+MULGVBhUgrAyWFQgeVdXodwB0
	C17bdb5ojMFvZqSKkpAHBAhPWA==
X-Google-Smtp-Source: AK7set9Gm2s1X+1cbgF0CvV7cnSBnC1SuqTALGUSeOxEWqT+nbfoCupXdbnEK6st6VZcQvRHXukfMQ==
X-Received: by 2002:a05:622a:174b:b0:3ba:1bcb:af01 with SMTP id l11-20020a05622a174b00b003ba1bcbaf01mr38114151qtk.59.1678476414390;
        Fri, 10 Mar 2023 11:26:54 -0800 (PST)
Received: from meerkat.local (bras-base-mtrlpq5031w-grc-30-209-226-106-7.dsl.bell.ca. [209.226.106.7])
        by smtp.gmail.com with ESMTPSA id r4-20020ac85204000000b003b9a6d54b6csm375068qtn.59.2023.03.10.11.26.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Mar 2023 11:26:54 -0800 (PST)
Date: Fri, 10 Mar 2023 14:26:52 -0500
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: tools@linux.kernel.org, Conor Dooley <conor@kernel.org>
Subject: Re: b4 shazam picking up the wrong author from patchwork/lore
Message-ID: <20230310192652.ymac3w2lucfdf34p@meerkat.local>
References: <mhng-2765f5e1-e3d9-4f36-82e2-1212e13b0cdd@palmer-ri-x1c9a>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <mhng-2765f5e1-e3d9-4f36-82e2-1212e13b0cdd@palmer-ri-x1c9a>

On Fri, Mar 10, 2023 at 09:38:54AM -0800, Palmer Dabbelt wrote:
> Conor just pointed out that 2a8db5ec4a28 ("RISC-V: Don't check text_mutex
> during stop_machine") was listed as authored by him, despite having a From
> in the message body.  That usually works fine so I'm not sure
> what happened here -- no big deal because neither of us really care about the
> authorship on this one (and the SOBs are fine), but figured it'd be best to say
> something in case it bites someone else.
> 
> I merged the patch with
> 
>    b4 shazam -lts https://patchwork.kernel.org/project/linux-riscv/patch/20230303143754.4005217-1-conor.dooley@microchip.com/
> 
> which is the way I usually do things.  This is the first time I've noticed any
> sort of issue like this.

Ooh, very neat catch. This would only happen under the following conditions:

- the message had to be patatt-signed
- you had to have had the key to properly validate it
- and, most importantly, there had to be mailman trailers in the message

When all of this was true, we would re-trim the body to the size that was
actually passing verification (using the l= parameter from the patatt
signature), but this lost the in-body From/Subject headers (because they were
moved into the actual message headers during verification). There were
workarounds initially for this happening, but they stopped working right
around 0.10.

This is now fixed in master and backported to 0.12.y. I will hopefully push
out a 0.12.2 some time today.

Thank you for the report.

-K
