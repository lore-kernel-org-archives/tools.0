Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B8F718D
	for <tools@linux.kernel.org>; Thu, 12 Jan 2023 16:33:35 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id m26-20020a05600c3b1a00b003d9811fcaafso15542718wms.5
        for <tools@linux.kernel.org>; Thu, 12 Jan 2023 08:33:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:reply-to:organization:from
         :references:cc:to:content-language:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Dz6OmoPDkr7os9btgzKMN6jXCd/38toeAx3YnPy7a0E=;
        b=nNQXpkcmA09Tl+aSwXu6bQerwsHcwB0lIDWUN2A7EUDvhbd57VXdqYt7DqPyR1KwNt
         2oI8P8A62R6eWz2B4J1NH4/GdbLeqmqrrCfSg7+4uAqycvyr0snJ22OGup0y7beicgWL
         Kiceliipk9ughzFY2xDbTUlU0tEhUfpce/wW6opnjzT2tZXgi28C0aj4jPfLhoKkBqlS
         57iCD750NwIUbqm5s24jORxj6li5GBUnsOnyzcSGHSZAMHzOoyVTpzGTAzA5JlkUTlR7
         zNBtgfwEbQv5Z1shMn9CDVJEuHZlDqvjpLTzvMPPkRpYV/cY8nwohZOpj0n5Pyi4j4X1
         OF9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:reply-to:organization:from
         :references:cc:to:content-language:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Dz6OmoPDkr7os9btgzKMN6jXCd/38toeAx3YnPy7a0E=;
        b=3JXhPBYoTTscWd0a79gsOA2ykrRuQaqped7eKadkMwfmFQzxL0zb/jFC6Hnnh0UF7P
         CZNG5E6UCPsJqdRqShkeUJ2f5i4WNvmapIVJ6ENsnmecpRWsl+5YtzgUD0pL0olFUFSK
         eIcGzDv9I1YUS5LSryRclSyJytXPn4c6Mmwzq13NFq222DvYZ/TX5IMuiCB1RTF23gL0
         jYWw0u5QACGPut9BEklEYGiZzopL1h/c44dtmdWsOTyBUex/kiFnEUlTIz2cHrUOscZx
         D7OWySdhyK6aEsZrfRjWiI4ztdKhJ/nGZPKWOydQ332bksMObP0Zy3FRYirWn+7SWIbI
         IhPg==
X-Gm-Message-State: AFqh2koQDUlcWloO7s4i/cmA4lAjfxWQklAbPxG+CNGoDEMmq84alcIz
	F3xQCE6glP21tElWkrN7XCxSRE7Xm5ypLtrf
X-Google-Smtp-Source: AMrXdXvPPKjqhgbEX8H2DwtjJ2cOGniFSY9WieiZAEA7PeuKyxH5TS4JX3nRjt0FybuHvJ8Q4aFJSg==
X-Received: by 2002:a05:600c:3ac6:b0:3d9:f801:73bf with SMTP id d6-20020a05600c3ac600b003d9f80173bfmr8520605wms.12.1673541213414;
        Thu, 12 Jan 2023 08:33:33 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:3b9e:7554:4633:9a59? ([2a01:e0a:982:cbb0:3b9e:7554:4633:9a59])
        by smtp.gmail.com with ESMTPSA id h10-20020a05600c2caa00b003cfd58409desm28041968wmc.13.2023.01.12.08.33.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Jan 2023 08:33:33 -0800 (PST)
Message-ID: <b20eb3e5-6b41-0ea4-086e-96edf7c23395@linaro.org>
Date: Thu, 12 Jan 2023 17:33:32 +0100
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: Message-ID length limit !
Content-Language: en-US
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: tools@linux.kernel.org
References: <6b4dc5aa-15a8-438c-ac53-1de49ec95c71@linaro.org>
 <20230112152621.ersbloeygrvci2ww@meerkat.local>
From: Neil Armstrong <neil.armstrong@linaro.org>
Organization: Linaro Developer Services
Reply-To: neil.armstrong@linaro.org
In-Reply-To: <20230112152621.ersbloeygrvci2ww@meerkat.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/01/2023 16:26, Konstantin Ryabitsev wrote:
> On Thu, Jan 12, 2023 at 10:53:56AM +0100, Neil Armstrong wrote:
>>
>> Hi,
>>
>> It seems I'm hitting a message-id length limit when sending with b4, here's a 2 patches thread:
>>
>> 0/2 https://lore.kernel.org/all/20230110-topic-sm8550-upstream-display-defconfig-v2-0-c29b9714c85f@linaro.org/
>> 1/2 https://lore.kernel.org/all/20230110-topic-sm8550-upstream-display-defconfig-v2-1-c29b9714c85f@linaro.org/
>> 2/2 https://lore.kernel.org/all/20230110-topic-sm8550-upstream-display-defconfig-v2-2-c29b9714c85f@linaro.org/
>>
>> Neither lore or thunderbird shows the thread correctly, so it seems the message-id is too long, right ?
> 
> Oh, look, you found yet another bug in Python's email module. This brings the
> critical bugs count to 4. For no reason at all, it decided to qp-encode the
> References and In-Reply-To headers:
> 
> 	Message-Id: <20230110-topic-sm8550-upstream-display-defconfig-v2-1-c29b9714c85f@linaro.org>
> 	References: =?utf-8?q?=3C20230110-topic-sm8550-upstream-display-defconfig-v2?=
> 	 =?utf-8?q?-0-c29b9714c85f=40linaro=2Eorg=3E?=
>      In-Reply-To: =?utf-8?q?=3C20230110-topic-sm8550-upstream-display-defconfig-v?=
>       =?utf-8?q?2-0-c29b9714c85f=40linaro=2Eorg=3E?=
> 
> I've reported this as https://github.com/python/cpython/issues/100991

Interesting...

> 
> I can't express how frustrating this is, but at least the work I've done this
> week on completely avoiding Python's email generation modules will help.
> 
> I will probably end up releasing 0.12 sooner than later, seeing as everyone's
> work is impacted by the quality of Python's email routines.

Thanks :-)

> 
> -K

