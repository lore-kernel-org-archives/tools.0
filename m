Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2E0D2579
	for <tools@linux.kernel.org>; Tue, 13 Dec 2022 09:15:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1670922949;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=utMbxA9CIsf3kZAItQwIwoNJJzkHcBrk7mIKDQ5W2Nw=;
	b=hYfOGK97fNRJ3o9oWRqcc1elr6FVtdEKEmOxkJtN3ayFuRfaB80PzgMzjdeXL5sbUdMhdI
	K23/FfHC9y5uS2fUPQuk5ZW9Hroygfhse6D6na0ffibx9O40kv1B1NohvY+KUdAF9tPoy8
	uPTbbElis6dskUGqTbC4MHLAzVxzNuc=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-653-OVXlNfS4NlqWM965Amk0aw-1; Tue, 13 Dec 2022 04:15:47 -0500
X-MC-Unique: OVXlNfS4NlqWM965Amk0aw-1
Received: by mail-wm1-f71.google.com with SMTP id p14-20020a05600c204e00b003cf4cce4da5so2772618wmg.0
        for <tools@linux.kernel.org>; Tue, 13 Dec 2022 01:15:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=utMbxA9CIsf3kZAItQwIwoNJJzkHcBrk7mIKDQ5W2Nw=;
        b=LpV7PxS25LMhD4akQ3A8KIVbPoAfweu15rmbdLagJWY+3Hze1HV7jQs5t/+8pasctI
         3+pVkY3FOQnFuBrbB2EWS5RSLNsrvKgmlGiVT+0vBeygvtZJRCCkitrwAei7TPNPMtfK
         TdYtrcK7HeyPFY6iYKiXa79mPrSeAD4vBNwKVymT/5PjPSMnFyXhKuC/XwaU7WrlDlNE
         qvcx+d0Cpx7D1vlByT7z5u3ccRCKoMN30PKxkadtaoXxFjktST7EBx3oefB8gbUh+6hK
         xz+S9r0JLSINl3naXlP4IzHXnHTHBwjP7WpKpDWckSwFUBKnSk53+qtGE1sQmPh31gxF
         7R0A==
X-Gm-Message-State: ANoB5pnNq7HqYwxyqShvkWRXpPb7qB0Bjisr5rkfCKDXSBGaBoMogNp2
	CkB12heOxmur/d1QVmF4LGDzbG8LzBamPYj8fFd82ukKk/q2N5P3045/tktVg+4uEDIVUs+2zMV
	esmx92WJG6CsmQvH5
X-Received: by 2002:a1c:cc1a:0:b0:3cf:5583:8b3f with SMTP id h26-20020a1ccc1a000000b003cf55838b3fmr15309661wmb.20.1670922946291;
        Tue, 13 Dec 2022 01:15:46 -0800 (PST)
X-Google-Smtp-Source: AA0mqf4zgGLbpgX8vS10SHwPwQDOk3M6bs2CabVehkBL02wc7pInPjPP2NgpzjA+4Ht3H5IcolV7cg==
X-Received: by 2002:a1c:cc1a:0:b0:3cf:5583:8b3f with SMTP id h26-20020a1ccc1a000000b003cf55838b3fmr15309647wmb.20.1670922946028;
        Tue, 13 Dec 2022 01:15:46 -0800 (PST)
Received: from [192.168.1.130] (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id y20-20020a1c4b14000000b003d208eb17ecsm11814175wma.26.2022.12.13.01.15.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Dec 2022 01:15:45 -0800 (PST)
Message-ID: <8a761e10-dfce-c240-a8a5-c8f7c77db637@redhat.com>
Date: Tue, 13 Dec 2022 10:15:44 +0100
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: b4: change in individual patch Cc: logic
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
 tools@linux.kernel.org, Greg KH <gregkh@linuxfoundation.org>,
 =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
References: <20221202155644.kbnqvune7mo4khue@meerkat.local>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20221202155644.kbnqvune7mo4khue@meerkat.local>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hello Konstantin,

On 12/2/22 16:56, Konstantin Ryabitsev wrote:
> Hi, all:
> 
> Per feedback in [1], I implemented the following change in how "b4 prep" and
> "b4 send" treat Cc: trailers in individual commits.
> 
> b4 prep change:
> 
> - `b4 prep --auto-to-cc` will no longer add Cc: trailers from individual
>   commits into the cover letter
> 
> b4 send change:
> 
> - Cc: addresses in the cover letter will receive *all* patches in the series
> - Cc: addresses in individual commits will receive the cover letter plus
>   *only* those patches where they are explicitly listed in Cc:
> 
> This change is in the latest b4 master branch (0.11-dev).
>

Awesome. Thanks a lot for doing this change!
 
> -K
> 
> [1] https://lore.kernel.org/all/20221201141642.uvonbrny4rhuacl5@meerkat.local/
> 

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

