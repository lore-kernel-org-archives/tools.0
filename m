Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA0387480
	for <tools@linux.kernel.org>; Thu,  1 Sep 2022 22:00:30 +0000 (UTC)
Received: by mail-qt1-f180.google.com with SMTP id x5so190238qtv.9
        for <tools@linux.kernel.org>; Thu, 01 Sep 2022 15:00:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject:from:to:cc;
        bh=BAyme0Q+mo5+gN0eiKFaygOJkcH8gM6pg2g3TN84EX8=;
        b=EGECw9r6MmoIFvXPcEI00qlf9h8g2jxBhQgMxzbtFZeQrniBXpmcf4fpkQ9dilqtqX
         f3LCIYRR3ukp5o9NGfV32Wp/Hk91Ac0zAzsOLk1/4iyGS9FBCUGP1co9uVxKZBQ7XGlB
         cvfeM1M9MD3kxsHN2Aws+OFmqUOgYmKJ9sLPRNip+jxg5qSGEvi3IvjfsFUf07h15Hea
         jygFLUGcOtcvciV7UfDTkrl5WAG3hY0KWWQpscBqbucxQCcPd2Bq51Wo2abMYimYRR2f
         giErs5EM6MUUlngBiYYaANJkvN96IQ05StAAiZzaq7qn8LLp4V/weVJbWT/nJxf+fWir
         eFEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :x-gm-message-state:from:to:cc;
        bh=BAyme0Q+mo5+gN0eiKFaygOJkcH8gM6pg2g3TN84EX8=;
        b=WtBdGJ5d+KPq8Z2/2l50SmFI81M1TVCsV3jQznLLlFLIhcF3PVHnA6jMaO9jdtsnCT
         5qCz2ySV0vikkDkch0zlxcTHcrYUk/Qf4QgIb7hCCdE0xN2cC7RuHNFyIcKPTpjocsPs
         IVocrGo0Zkf28XxRZwYKwQ1m8xYs84AKjZz+EiLyAGJM/RqEX+rA4/uANDq7U8lPDnmE
         PF3DPdNezLPRn1MOQWtevrkiuFcHWPlobNAeLIDxoWvDUOcATQHcN4U7Tm6+syQ8wI3t
         MM+4O51YQ9EzD58/eU1XRQU6FQy33or5HOQy5/4Tzh3y0HoVdJ3mn53mtqO8n7+LoI0g
         GnTQ==
X-Gm-Message-State: ACgBeo0yI+1oAGnrcl27XWc2t+Oy1qnxdTFpYWnELmMQf8Zu4TZVNuLz
	bb6Ym/dPRAxBWDNLQGjUgWAYHNVb/n4=
X-Google-Smtp-Source: AA6agR7DdOby76Zo9VEQPlGcDxGcoEZWxAIlginqJvnWcwH7byRWxUutpmq+q3JbQj6ETV68eAFD7Q==
X-Received: by 2002:ac8:5704:0:b0:343:55eb:acf with SMTP id 4-20020ac85704000000b0034355eb0acfmr25402311qtw.322.1662069629231;
        Thu, 01 Sep 2022 15:00:29 -0700 (PDT)
Received: from [192.168.1.127] (173-246-5-136.qc.cable.ebox.net. [173.246.5.136])
        by smtp.gmail.com with ESMTPSA id x6-20020ac86b46000000b00339b8a5639csm11023348qts.95.2022.09.01.15.00.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Sep 2022 15:00:28 -0700 (PDT)
Subject: Re: Using b4 with full URLs still uses lore.kernel.org by default
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: tools@linux.kernel.org
References: <f2b0f3c1-d98d-979d-1513-18f2491f4267@gmail.com>
 <20220901213209.hpoqzskcozhkxnqn@meerkat.local>
From: Philippe Blain <levraiphilippeblain@gmail.com>
Message-ID: <f22f01f9-013c-8ba6-a72e-19904d11ce04@gmail.com>
Date: Thu, 1 Sep 2022 18:00:27 -0400
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.11; rv:78.0)
 Gecko/20100101 Thunderbird/78.14.0
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20220901213209.hpoqzskcozhkxnqn@meerkat.local>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit

Hi Konstantin,

Le 2022-09-01 à 17:32, Konstantin Ryabitsev a écrit :
> On Tue, Aug 30, 2022 at 01:00:20PM -0400, Philippe Blain wrote:
>> $ b4 mbox -o- https://inbox.sourceware.org/gdb-patches/cover.1661868744.git.aburgess@redhat.com/T/#t
>> Grabbing thread from lore.kernel.org/gdb-patches/cover.1661868744.git.aburgess%40redhat.com/t.mbox.gz
>> Server returned an error: 404
>>
>> It does work correctly if I set 'b4.midmask' to 'https://inbox.sourceware.org/r/%s'
>> in my local Git config file, but sometimes I used b4 outside of any Git 
>> repository just to transfer threads to my IMAP account (piping b4 mbox to git imap-send)
>> so it would be convenient if full URLs were not re-written.
> 
> Okay, I pushed a change that should allow you to do that, but this will only
> reasonably work with "b4 am" or "b4 mbox". To properly work for all other
> cases, the midmask and linkmask settings need to be properly set to point at
> the proper server, e.g.:
> 
> [b4]
>   linkmask = 'https://inbox.sourceware.org/%s'
>   midmask = 'https://inbox.sourceware.org/%s'
> 
> However, for what you are trying to do it should work now. The change is both
> in master and in stable-0.9.y. If all goes well, I'll release 0.9.1 tomorrow.

Great! Thanks.


