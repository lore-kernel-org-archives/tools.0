Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA8142560
	for <tools@linux.kernel.org>; Thu, 22 Sep 2022 22:11:41 +0000 (UTC)
Received: by mail-qt1-f170.google.com with SMTP id a20so7312418qtw.10
        for <tools@linux.kernel.org>; Thu, 22 Sep 2022 15:11:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date;
        bh=EpqGKRQPQ/ExWY5gPE3GtmWn6sOOjqT7rE32m1zmZb8=;
        b=cFPc7xkZPijn5nyyumC33M6EG/oI+EDCyCYw3R/CcZFU818mSzG4qgkYspcB9pqoFT
         +d6h9MiCv60K0MIokRiyFnfDlx2ovWQkcAQ9zj40dAyYNC8Boe0Ih7I+L+vy1HvaZ226
         eCHW4xa/0sQj70fztcv68OeGR9U6aR279IFdo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date;
        bh=EpqGKRQPQ/ExWY5gPE3GtmWn6sOOjqT7rE32m1zmZb8=;
        b=P2coNsBvaj+gLnmBPdsdazolD1Mn6ImH93Ilm4C1B9YUgYL3UaURd2WhNB22uOZadl
         0ahy9HWPFsVTR3+xpCH9oBQ9B9ROIIAsLRUS3S3sbkwYxPfqzpcQe1t2KscosI2SjuU7
         XUxPPxwpJHx3JwvooVAd1jPpHS09FTZubabmGy+8cdLAxB9JykWk/zwgz1Z41jd/aAV8
         jm76UBWx2xs/b3A3Zb32W1pHuU8DvSqfnUcrEwUeeK8HA3UlHoupoWXT0as6CBwlRXC4
         +pnXJnpgnJmns9Xe8phCa6N+8mJ0lqtkXhybq9nDv+jFDEi9fYY9xiW8OQNMuDhNrT6H
         EFIg==
X-Gm-Message-State: ACrzQf3Zq0Y2s4CHBB9peY8n5KFPMab+OtfB7mqhGEwCmyokKQKERUBp
	SDRIcZUhisqcdfJoT/f+7l9pew==
X-Google-Smtp-Source: AMsMyM4N43it07g8NGiw3/oDJtmZ4oDfoHGHh9mltf/qSdf/u691pgtzf7WLb76PGcnUyAW1wo9Iaw==
X-Received: by 2002:ac8:59d0:0:b0:35b:b656:cb93 with SMTP id f16-20020ac859d0000000b0035bb656cb93mr4701790qtf.636.1663884700759;
        Thu, 22 Sep 2022 15:11:40 -0700 (PDT)
Received: from meerkat.local (bras-base-mtrlpq5031w-grc-33-142-113-79-147.dsl.bell.ca. [142.113.79.147])
        by smtp.gmail.com with ESMTPSA id t15-20020a37aa0f000000b006cbc6e1478csm4373654qke.57.2022.09.22.15.11.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Sep 2022 15:11:40 -0700 (PDT)
Date: Thu, 22 Sep 2022 18:11:38 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: users@linux.kernel.org, tools@linux.kernel.org
Subject: Re: b4 is having trouble with unicode emails
Message-ID: <20220922221138.52m4ghjv6gyoaxni@meerkat.local>
References: <YyzPSrTcGliahL+a@google.com>
 <20220922214840.fw7kdyjidsp2g4vi@meerkat.local>
 <YyzasbZ80Osek12a@google.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YyzasbZ80Osek12a@google.com>

On Thu, Sep 22, 2022 at 02:59:13PM -0700, Dmitry Torokhov wrote:
> > The latest master/stable-0.10.y should have handle this properly.
> 
> No, if you look closely in my log there were 2 invocations, one with
> 
> 	--to 'Marek Behún <kabel@kernel.org>'
> 
> which dies with UnicodeEncodeError exception, while another, with
> 
> 	--to='Marek Behun <kabel@kernel.org>'
> 
> works properly.

Sure, but the problem was as I described. If we properly parse the --to
parameter as a header-like email address, as opposed to just expecting a bare
email address there, the fix does the right thing.

-K
