Received: from smtp.domeneshop.no (smtp.domeneshop.no [194.63.252.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3792463C0
	for <tools@linux.kernel.org>; Wed, 30 Nov 2022 16:17:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tronnes.org
	; s=ds202112; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=Sl9a9lBCDPVz7u0YjM3J3HqZgfwIYhuAxGDCvEUx4t4=; b=MT4AUxJqY9kL2uSbqTEcYnxtXO
	lUvLOkvyjko2OVQW9AAyBdZm8oB1lIhkd9o/60gpu7IuY6q0rFgGVl219f0be7pb3UwtQSawVec+3
	GWIv69uuggiuwuQ+5/gkgrPp5NduOCeM7VqeLpMXmiF3HuuL0yspWP4unTLdiCzIjjCYvLSQGOMV+
	GIkazwlNj/CACqNCcEse+mi9eFpWgXwf34KED3n44h6w6ZasDuHrewNfvNKjtw2J4/akP1MnM8ufv
	G2gXBq0GltgBjJt4pVLDPgfAX8VWi0E1DgXLuHQABIfaHrv+Ri1B2aKmFeYfHgBh/X+Si0hApT3VK
	dKmiwZzQ==;
Received: from [2a01:799:95e:1700:6395:ccbd:d000:d42b] (port=49734)
	by smtp.domeneshop.no with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <noralf@tronnes.org>)
	id 1p0PmM-0006je-8Z; Wed, 30 Nov 2022 17:17:46 +0100
Message-ID: <b1fb933e-e8b7-a46b-5234-7fd469ea9524@tronnes.org>
Date: Wed, 30 Nov 2022 17:17:44 +0100
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: Error using b4 web endpoint (was Re: git send-email friendly smtp
 provider anyone?)
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: tools@linux.kernel.org, =?UTF-8?Q?Noralf_Tr=c3=b8nnes?=
 <noralf@tronnes.org>
References: <20221122155122.edxtmsqpjxgj4dsj@meerkat.local>
 <3b06dfd5-0eb4-dbfc-6ba8-077b1a92865b@tronnes.org>
 <20221122185001.q6hmeblp64jqdzvz@meerkat.local>
 <02bc2442-e3b3-d720-9d13-ffcdfd760fb8@tronnes.org>
 <20221122194428.fmbayuz6vbvdd6uw@meerkat.local>
 <3d2f9038-435f-f78e-31f4-59dbae587d18@tronnes.org>
 <20221122200049.ma5jpfiawmgmpng2@meerkat.local>
 <d9951176-24ed-ded1-c5dd-5586f779483d@tronnes.org>
 <20221122202033.jeukag3i5pttqp5d@meerkat.local>
 <4161738f-e2df-2d8e-7646-2c61df2f76b9@tronnes.org>
 <20221122204456.6tqutsoybrisa4xf@meerkat.local>
 <4adcd45f-21e7-698e-dc97-70995850ac9f@tronnes.org>
From: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
In-Reply-To: <4adcd45f-21e7-698e-dc97-70995850ac9f@tronnes.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



Den 22.11.2022 22.03, skrev Noralf Trønnes:
> 
> 
> Den 22.11.2022 21.44, skrev Konstantin Ryabitsev:
>> On Tue, Nov 22, 2022 at 09:26:03PM +0100, Noralf Trønnes wrote:
>>>> However, I see that it's failing on Debian 11 with the JSON error.
>>>> I'll poke some more now that I have a test env and follow up.
>>>>
>>>
>>> Yeah that test snippet fails with the same error.
>>>
>>> $ lsb_release -ir
>>> Distributor ID: Ubuntu
>>> Release:        22.04
>>
>> Okay, this is not a real fix, but it will get things working for you while I
>> implement the proper solution:
>>
>> apt install python3-simplejson
>>
> 
> Thanks, no errors this time.
> 
> Series:
> https://lore.kernel.org/dri-devel/20221122-gud-shadow-plane-v1-0-9de3afa3383e@tronnes.org/
> 

I'm ready to send version 2 of my patchset, but it doesn't work.

$ ~/projects/b4/b4.sh --version
0.11.0-dev-cc6f6

$ ~/projects/b4/b4.sh send
Converted the branch to 7 messages
Populating To/Cc addresses
Will send the following messages:
---
To: Maxime Ripard <mripard@kernel.org>
    Thomas Zimmermann <tzimmermann@suse.de>
    dri-devel@lists.freedesktop.org
    Noralf Trønnes <noralf@tronnes.org>
    stable@vger.kernel.org
    Javier Martinez Canillas <javierm@redhat.com>
---
  [PATCH v2 0/6] drm/gud: Use the shadow plane helper
  [PATCH v2 1/6] drm/gud: Fix UBSAN warning
  [PATCH v2 2/6] drm/gud: Don't retry a failed framebuffer flush
  [PATCH v2 3/6] drm/gud: Split up gud_flush_work()
  [PATCH v2 4/6] drm/gud: Prepare buffer for CPU access in gud_flush_work()
  [PATCH v2 5/6] drm/gud: Use the shadow plane helper
  [PATCH v2 6/6] drm/gud: Enable synchronous flushing by default
---
Press Enter to send or Ctrl-C to abort
---
Sending via web endpoint https://lkml.kernel.org/_b4_submit
---
CRITICAL: Was not able to send messages.


Printing some more info:

diff --git a/b4/__init__.py b/b4/__init__.py
index 64b36f6..eb62719 100644
--- a/b4/__init__.py
+++ b/b4/__init__.py
@@ -3294,9 +3294,12 @@ def send_mail(smtp: Union[smtplib.SMTP,
smtplib.SMTP_SSL, None], msgs: Sequence[
             'messages': [x[1].decode() for x in tosend],
         }
         ses = get_requests_session()
+        print('ses:', ses)
         res = ses.post(endpoint, json=req)
+        print('res', res)
         try:
             rdata = res.json()
+            print('rdata', rdata)
             if rdata.get('result') == 'success':
                 return len(tosend)
         except Exception as ex:  # noqa

Gives me this:

---
Sending via web endpoint https://lkml.kernel.org/_b4_submit
ses: <requests.sessions.Session object at 0x7f8da11e6920>
res <Response [500]>
rdata {'title': '500 Internal Server Error'}
---
CRITICAL: Was not able to send messages.

So looks like a server error and b4 is unable to pick up on that.

I went straight for the latest dev version this time, let me know if I
should try 0.10.1 which I used to send the previous patchset.

Noralf.
