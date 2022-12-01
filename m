Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC0EA2F5F
	for <tools@linux.kernel.org>; Thu,  1 Dec 2022 14:27:34 +0000 (UTC)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id D9C9F1F747;
	Thu,  1 Dec 2022 14:27:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1669904852; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GE4yd9MKM3Zw6FBLKe9AhP4ldQ97LGjpS1l/V1scazA=;
	b=JMQwrY7SkTnGM0gUVoD2F4bWWFY8HoKDL0aBB6PlUcNRFRocDkmBk8lMybIJUs5HGSbft9
	pmqXgkVzZAbSM08NeVePMc9wnTPcGL87hVgfVPqZgJGqww718wCj2wb4ext71I3800mn5v
	FDW4jAYASkWclptJxRgZvB/0WgeH3yo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1669904852;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GE4yd9MKM3Zw6FBLKe9AhP4ldQ97LGjpS1l/V1scazA=;
	b=PVMP3+yMLhzUi0bb9yIe3DfCd+rcrOlU8fXCzA1W40YXUfgLMQ/EUG04X38b1RIu8YQLlZ
	ZCPEUAdYGW7Ca9Dw==
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id AEEDD1320E;
	Thu,  1 Dec 2022 14:27:32 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap1.suse-dmz.suse.de with ESMTPSA
	id O/ikKdS5iGPcMgAAGKfGzw
	(envelope-from <vbabka@suse.cz>); Thu, 01 Dec 2022 14:27:32 +0000
Message-ID: <dad6891d-5ca2-b849-b504-1a37b4741886@suse.cz>
Date: Thu, 1 Dec 2022 15:27:32 +0100
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v2 0/6] drm/gud: Use the shadow plane helper
Content-Language: en-US
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
 Javier Martinez Canillas <javierm@redhat.com>
Cc: Greg KH <gregkh@linuxfoundation.org>, =?UTF-8?Q?Noralf_Tr=c3=b8nnes?=
 <noralf@tronnes.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>,
 tools@linux.kernel.org
References: <20221122-gud-shadow-plane-v2-0-435037990a83@tronnes.org>
 <Y4hB5odv9IGaq3Di@kroah.com>
 <1cb40762-5f0a-1739-1670-155f59ec7110@tronnes.org>
 <Y4iaODY6hMVNsfP1@kroah.com>
 <4e75582c-b3d6-fb0e-19b4-e4fd58c6bf55@tronnes.org>
 <Y4iqR94aGFa3NahQ@kroah.com>
 <e57deac6-5344-3f81-8ef5-55dd28b8c363@redhat.com>
 <20221201141642.uvonbrny4rhuacl5@meerkat.local>
From: Vlastimil Babka <vbabka@suse.cz>
In-Reply-To: <20221201141642.uvonbrny4rhuacl5@meerkat.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/1/22 15:16, Konstantin Ryabitsev wrote:
> On Thu, Dec 01, 2022 at 02:34:41PM +0100, Javier Martinez Canillas wrote:
>>>> Konstantin,
>>>>
>>>> Can you add a rule in b4 to exclude stable@vger.kernel.org
>>>> (stable@kernel.org as well?) from getting the whole patchset?
>>>
>>> stable@kernel.org is a pipe to /dev/null so that's not needed to be
>>> messed with.
>>>
>>> As for this needing special casing in b4, it's rare that you send out a
>>> patch series and only want 1 or 2 of them in stable, right?
>>>
>>
>> Not really, it's very common for a patch-series to contain fixes (that could
>> go to stable if applicable) and change that are not suitable for stable. The
>> problem as Noralf mentioned is that the b4 tool doesn't seem to allow Cc'ing
>> individual patches to different recipients, and everyone get the whole set.
>>
>> So either b4 needs to have this support, exclude stable@vger.kernel.org when
>> sending a set or stable@vger.kernel.org ignore patches without a Fixes: tag.
> 
> I think what I can do is a special logic for Cc: trailers:
> 
> - Any Cc: trailers we find in the cover letter receive the entire series
> - Any Cc: trailers in individual patches only receive these individual patches

I usually do that with git send-email and a custom --cc-cmd script, but 
additionally it sends the cover letter also to everyone that's on any 
individual patch's Cc, so everyone gets at least the cover letter + 
their specific patch(es).

But that extra logic could be optional.

> Thank you for being patient -- we'll get this right, I promise.
> 
> -K
> 

