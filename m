Received: from smtp.domeneshop.no (smtp.domeneshop.no [194.63.252.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 556861C10
	for <tools@linux.kernel.org>; Thu,  1 Dec 2022 13:14:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tronnes.org
	; s=ds202112; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=oaV98Os6HBmfusJ4SjEZi1K/vSpKj71/XDz3LzQygJc=; b=MGXbDqug+i6tVKOzRABQEizEbN
	XxECWClHkIe0I9VkAn6Xf9W/BeEH3HIgWqlPNIizbPIO2XI5cqeV3q7DDKzyvVWiwQT8Uyx8RGs08
	bVwH3lCxBFZPfS4f0apog5x/xtLU9M1rjtdjqyo149BTtWg6iywyQupPn2Fw9EligzDF2uMgw5B6C
	v77rZQE//jwZ3FA9N4iGsS1rnmWlj2bYvwmKyCxLDJR7kiCEf0lKbiMLANK1L1UcGLv/F8Ct8qdW9
	T13kZXViJ+FSWAQ2j1v7cppBLFhldzrd9hxbjPkg9HIClN87JaO7+zQRAqnTtyO0dlOp/IHqAoMDy
	U7sQJwVg==;
Received: from [2a01:799:95e:1700:6395:ccbd:d000:d42b] (port=59118)
	by smtp.domeneshop.no with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <noralf@tronnes.org>)
	id 1p0jOm-00024L-Uj; Thu, 01 Dec 2022 14:14:44 +0100
Message-ID: <4e75582c-b3d6-fb0e-19b4-e4fd58c6bf55@tronnes.org>
Date: Thu, 1 Dec 2022 14:14:42 +0100
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v2 0/6] drm/gud: Use the shadow plane helper
To: Greg KH <gregkh@linuxfoundation.org>,
 Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>,
 Javier Martinez Canillas <javierm@redhat.com>,
 dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>,
 tools@linux.kernel.org, =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
References: <20221122-gud-shadow-plane-v2-0-435037990a83@tronnes.org>
 <Y4hB5odv9IGaq3Di@kroah.com>
 <1cb40762-5f0a-1739-1670-155f59ec7110@tronnes.org>
 <Y4iaODY6hMVNsfP1@kroah.com>
From: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
In-Reply-To: <Y4iaODY6hMVNsfP1@kroah.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



Den 01.12.2022 13.12, skrev Greg KH:
> On Thu, Dec 01, 2022 at 11:00:44AM +0100, Noralf Trønnes wrote:
>>
>>
>> Den 01.12.2022 06.55, skrev Greg KH:
>>> On Wed, Nov 30, 2022 at 08:26:48PM +0100, Noralf Trønnes via B4 Submission Endpoint wrote:
>>>> Hi,
>>>>
>>>> I have started to look at igt for testing and want to use CRC tests. To
>>>> implement support for this I need to move away from the simple kms
>>>> helper.
>>>>
>>>> When looking around for examples I came across Thomas' nice shadow
>>>> helper and thought, yes this is perfect for drm/gud. So I'll switch to
>>>> that before I move away from the simple kms helper.
>>>>
>>>> The async framebuffer flushing code path now uses a shadow buffer and
>>>> doesn't touch the framebuffer when it shouldn't. I have also taken the
>>>> opportunity to inline the synchronous flush code path and make this the
>>>> default flushing stategy.
>>>>
>>>> Noralf.
>>>>
>>>> Cc: Maxime Ripard <mripard@kernel.org>
>>>> Cc: Thomas Zimmermann <tzimmermann@suse.de>
>>>> Cc: dri-devel@lists.freedesktop.org
>>>> Signed-off-by: Noralf Trønnes <noralf@tronnes.org>
>>>>
>>>> ---
>>>> Changes in v2:
>>>> - Drop patch (Thomas):
>>>>   drm/gem: shadow_fb_access: Prepare imported buffers for CPU access
>>>> - Use src as variable name for iosys_map (Thomas)
>>>> - Prepare imported buffer for CPU access in the driver (Thomas)
>>>> - New patch: make sync flushing the default (Thomas)
>>>> - Link to v1: https://lore.kernel.org/r/20221122-gud-shadow-plane-v1-0-9de3afa3383e@tronnes.org
>>>
>>> <formletter>
>>>
>>> This is not the correct way to submit patches for inclusion in the
>>> stable kernel tree.  Please read:
>>>     https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html
>>> for how to do this properly.
>>>
>>> </formletter>
>>
>> Care to elaborate?
>> Is it because stable got the whole patchset and not just the one fix
>> patch that cc'ed stable?
> 
> That is what triggered this, yes.
> 
>> This patchset was sent using the b4 tool and I can't control this
>> aspect. Everyone mentioned in the patches gets the whole set.
> 
> Fair enough, but watch out, bots will report this as being a problem as
> they can't always read through all patches in a series to notice this...
> 

Konstantin,

Can you add a rule in b4 to exclude stable@vger.kernel.org
(stable@kernel.org as well?) from getting the whole patchset?

Noralf.
