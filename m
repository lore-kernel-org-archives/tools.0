Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 981A58F59
	for <tools@linux.kernel.org>; Wed, 22 Feb 2023 17:52:43 +0000 (UTC)
Received: by mail-qv1-f54.google.com with SMTP id ev13so9345892qvb.10
        for <tools@linux.kernel.org>; Wed, 22 Feb 2023 09:52:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0RWX++YUJxU8P8VFsGZ1ciU5el+4cPiHRaXwEEjKiR8=;
        b=OyaSfeipL9hiNvjWy2PWr/oYAOmw7stx4sPz0Nw9aDY4qMpjeGO6fhApbRvrlRToOE
         qaGampSqLkwfgEgSr0+Lr2i37QIuDtAgrq8B5BuiqdivE+ATdgDCs5nkfPzd7odbuppX
         WbN/Fg4+mb9YYd0iyJrhD8EZQ2XAOSJAABJqrmv8C9N6ZbtpxKcEotCCLmnphWlZqCrv
         jdqiBTmV99Pv7b5jrUsEWH7YGUf/E2qD9Q+JEk/VE6S03R6T6dezuNXBd05cDlglDryw
         Pz6Vkf8RKPIKhtOaRU+i3RAEtrvJvXxTlr8u4OLFZ59kxO5Jf2eBcl7/vl82SgOr3q//
         q27g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0RWX++YUJxU8P8VFsGZ1ciU5el+4cPiHRaXwEEjKiR8=;
        b=l2txtPtZv36NJPvC/h0prU444cMeAyzz1zOJt0MJ2Cdba478jOntT+bmEFCfL8OqrJ
         g0wZSQNzGMOFxpYf2VNRhwgs1wrP7qsAURKnxfblFymv/CjGRxf9v/xbe29omZwj3cVW
         +0+oLNinLPm/qsXtCiekG3WB6swJ4YYs1lzMuWS9k83ZKkBLPD/XUDmDSD4uWfqNEQrG
         OMUS1W+3/Ld4a0I6ZbvOpxPvwq56UZ6/VJxU7ISmpOeJ5N3e7vUALON6FP4TEOlQQyPZ
         e9Iuulz045LUsJC++V2rg3K37HVMC+wsy40rR3oLdOInaWgzxucqMpM3NwZ6U3HKogG6
         /OUg==
X-Gm-Message-State: AO0yUKUoIQ7P4JI8UKCpqBD4MWGjXIC0ub2D1o1HHtVN+l5spSSyI0P3
	wOWfK05KaFotcusfp7t9w4IegYnuEgc=
X-Google-Smtp-Source: AK7set+5Ff6rjupafJYDjD/UsYx0Pkz8iw3rtJMQBBIt3KXwZllyM/FQqG6pvMtzh6hJRYH9N/MJAA==
X-Received: by 2002:a05:6214:1d2e:b0:56e:f609:438a with SMTP id f14-20020a0562141d2e00b0056ef609438amr15227526qvd.15.1677088362219;
        Wed, 22 Feb 2023 09:52:42 -0800 (PST)
Received: from [192.168.1.128] (173-246-5-136.qc.cable.ebox.net. [173.246.5.136])
        by smtp.gmail.com with ESMTPSA id j187-20020a3787c4000000b00739e7e10b71sm1123024qkd.114.2023.02.22.09.52.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Feb 2023 09:52:41 -0800 (PST)
Subject: Re: [PATCH b4 0/3] ez: allow sending all versions of a patch series
 in the same thread
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: "Kernel.org Tools" <tools@linux.kernel.org>
References: <20230219-send-iterations-in-same-thread-v1-0-59b802382eb5@gmail.com>
 <20230222022525.p7jtphm7rc4dfurw@meerkat.local>
From: Philippe Blain <levraiphilippeblain@gmail.com>
Message-ID: <39d797ca-4276-df1d-d541-03558965ee8e@gmail.com>
Date: Wed, 22 Feb 2023 12:52:40 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.11; rv:78.0)
 Gecko/20100101 Thunderbird/78.14.0
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20230222022525.p7jtphm7rc4dfurw@meerkat.local>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit

Hi Konstantin,

Le 2023-02-21 à 21:25, Konstantin Ryabitsev a écrit :
> On Tue, Feb 21, 2023 at 08:29:16PM -0500, Philippe Blain wrote:
>> Sending a new iteration of a series in the same thread as the previous
>> one is the preferred workflow on some lists, the Git mailing list being
>> an example [1].
>>
>> This series allows that workflow in b4 by adding a '--same-thread'
>> option to 'b4 send', with an associated config option.
> 
> Thanks, Philippe.
> 
> I think I prefer to *just* have this be set in config, without the CLI switch.
> The goal is to make "b4 prep" workflow be friendly to newbies, so having
> --help output a ton of options is the situation I want to avoid.
> 
> I'll take this in if you drop the --same-thread switch.

Yeah, I agree this will usually be a "set it once for this project and forget"
kind of thing, so it makes sense for it to be only settable in the config.

I will do that for v2.

Thanks,

Philippe.
