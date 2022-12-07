Received: from smtp.domeneshop.no (smtp.domeneshop.no [194.63.252.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DF132F2D
	for <tools@linux.kernel.org>; Wed,  7 Dec 2022 18:12:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tronnes.org
	; s=ds202112; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:Cc:
	References:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID
	:Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:
	Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe
	:List-Post:List-Owner:List-Archive;
	bh=V7ZQNungUBHWs6FoCzxNj3SzZZlM6mfSo5BH4o3SZzc=; b=i8Xc5ESjWHollCfgWU95TAu3U8
	q1e71gr3k9FG+tk+HWDkv5xjzzI7s3LWdox6EqimmlhGqWDyp20WobgZRMGTm7NyVGg1286VPWLzu
	u9Xm7Nli3RteXMacXXDbJqDyienbAn5YzVwLNXBSUyCjbL1oyXBPuV6YNby+0nwixYr9yuCXhpyA6
	gYXA0hPPJEBzmI7Fp0ImVVCN3bNgzFNhXs1v4I0BQ+GeUrZMeQRt2Ij09XXQpEzWGhu7+zyo5hvBG
	DAxfslRHTEN/v1Ku8be8q6V+kEstMzVOl7474deCxlHZpCibYMr/hEDO2eYuUiRF+kDyWkz6lCxuy
	oBrSRPAA==;
Received: from [2a01:799:95e:1700:6395:ccbd:d000:d42b] (port=57369)
	by smtp.domeneshop.no with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <noralf@tronnes.org>)
	id 1p2yuG-003GcV-HJ;
	Wed, 07 Dec 2022 19:12:32 +0100
Message-ID: <90c5f16c-61c4-6f5f-7d11-9fe8de09468d@tronnes.org>
Date: Wed, 7 Dec 2022 19:12:29 +0100
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: new: b4 send --reflect
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
 tools@linux.kernel.org
References: <20221206215340.556ov3bdfyf3qvyy@meerkat.local>
 <f8d14fd5-58e0-853d-64e0-72cc60e69629@tronnes.org>
Cc: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
From: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
In-Reply-To: <f8d14fd5-58e0-853d-64e0-72cc60e69629@tronnes.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



Den 07.12.2022 17.39, skrev Noralf Trønnes:
> 
> 
> Den 06.12.2022 22.53, skrev Konstantin Ryabitsev:
>> Hi, all:
>>
>> Final feature before 0.11 (hopefully) -- there is a new test mode for b4 send
>> that will only email the series to yourself instead of the actual destinations
>> listed in "To" or "Cc" headers.
>>
>> This should be particularly useful to anyone using the web submission
>> endpoint, because this will allow them to see any post-processing that the
>> remote will do to their patches (such as rewriting From: for DMARC purposes).
>>
> 
> I've always sent the patches to myself for a final check before sending
> them off, so this is perfect.
> 
> But it doesn't work for me yet:
> 
> $ ~/projects/b4/b4.sh send --hide-cover-to-cc --reflect
> Converted the branch to 1 messages
> ---
> To: dri-devel@lists.freedesktop.org
>     tzimmermann@suse.de
>     kernel test robot <lkp@intel.com>
>     Noralf Trønnes <noralf@tronnes.org>
> ---
>   [PATCH] drm/gud: Fix missing include
> ---
> Ready to:
>   - send the above messages to just noralf@tronnes.org (REFLECT MODE)
>   - via web endpoint: https://lkml.kernel.org/_b4_submit
> 
> Press Enter to proceed or Ctrl-C to abort
> ---
> Reflecting via web endpoint https://lkml.kernel.org/_b4_submit
> Error from endpoint: This service only accepts patches
> ---
> CRITICAL: Was not able to send messages.
> 
> $ ~/projects/b4/b4.sh --version
> 0.11.0-dev-b77ec
> 
> Cover letter:
> 
> $ git show 6c2812de7efe
> commit 6c2812de7efe27951c95c9f736215675009da3fb
> Author: Noralf Trønnes <noralf@tronnes.org>
> Date:   Wed Dec 7 12:58:01 2022 +0100
> 
>     dummy
>     Cc: dri-devel@lists.freedesktop.org
>     Cc: tzimmermann@suse.de
> 
>     --- b4-submit-tracking ---
>     # This section is used internally by b4 prep for tracking purposes.
>     {
>       "series": {
>         "revision": 1,
>         "change-id": "20221207-gud-missing-include-9ccf56382f8a",
>         "base-branch": null
>       }
>     }
> 
> I've attached the 'b4 send --hide-cover-to-cc -o' output.
> 

I wanted to get this patch out so I dropped the --reflect, but I got the
same error.

Noralf.
