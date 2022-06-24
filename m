Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D7637C;
	Fri, 24 Jun 2022 08:34:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1656059660; x=1687595660;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=buHvzfqP6HDWOnBNbXkm1ECwoeG4OWeYeWWmf+Pp2dQ=;
  b=uvWL5CtkbA3l24pt9H/s1mrq1N7ZYmMTCL6uS22BwDl8GKrg8BafGfGv
   2OIVsTGyZ+TtaNlHZIZ5MSwHSXik+YBCmX/+71tQP2pJzdLFSg8SBXKlK
   lxsYDzCtXGRkzhHIOdZJibjEujwL4QYmqRSjouRhXoKAEZdSmK1chZXGH
   fYPoGHSU04Q2qRfE6BKq4pbN+B45cTxG9Fsg071fxaqIKkr+uCQyWu0J+
   EFR2VNlt2WWeWD8VNa+yMCV8/3TV2ADu4LCMPuDegL/Je6JNW0nH3Gspn
   iYZeHVy5f4lu2xZL2RN0RKw5W9nOcQax3z+PsBeM9rILixI62WkuwNShl
   w==;
X-IronPort-AV: E=Sophos;i="5.92,218,1650956400"; 
   d="scan'208";a="169445615"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 24 Jun 2022 01:34:12 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Fri, 24 Jun 2022 01:34:11 -0700
Received: from [10.12.72.26] (10.10.115.15) by chn-vm-ex02.mchp-main.com
 (10.10.85.144) with Microsoft SMTP Server id 15.1.2375.17 via Frontend
 Transport; Fri, 24 Jun 2022 01:34:10 -0700
Message-ID: <3d00ccd4-509b-f350-2612-ea0b0c8d2743@microchip.com>
Date: Fri, 24 Jun 2022 10:34:09 +0200
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: b4-0.9.0 available
Content-Language: en-US
To: Bjorn Andersson <bjorn.andersson@linaro.org>, "Jason A. Donenfeld"
	<Jason@zx2c4.com>, Konstantin Ryabitsev <konstantin@linuxfoundation.org>
CC: Linus Torvalds <torvalds@linuxfoundation.org>, Geert Uytterhoeven
	<geert@linux-m68k.org>, <tools@linux.kernel.org>, <users@linux.kernel.org>
References: <20220617190153.tvi5lkzlvemeqou5@meerkat.local>
 <CAMuHMdV4AHH1TM6xf26MP0-dUQ0-fB+62GeeuVuth9pgWgdu7Q@mail.gmail.com>
 <20220621152903.czivp7fdn6me775i@meerkat.local>
 <CAMuHMdWz8=Zr8hnXNGBZVfe70F8oVdK670Z41=Dtib0GMDgAug@mail.gmail.com>
 <CAHk-=wiQzp+aurcmj15=LAa2ntvRZH0Ee2dn-PLjcFpmRE6Jcw@mail.gmail.com>
 <CAHmME9p+zRErOsvA1zC=kTHtpYD_sGjFxVsj0pMwteAp4dCdjQ@mail.gmail.com>
 <20220621165953.z25hwos7gom6bp6s@meerkat.local> <YrIEnmt5vDMcbOiG@zx2c4.com>
 <20220621182953.p5asczznnz3pn6dl@meerkat.local> <YrIR2v7GdC3qIt2E@zx2c4.com>
 <YrI3W46GUS/Dap5J@ripper>
From: Nicolas Ferre <nicolas.ferre@microchip.com>
Organization: microchip
In-Reply-To: <YrI3W46GUS/Dap5J@ripper>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 21/06/2022 at 23:25, Bjorn Andersson wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> On Tue 21 Jun 11:45 PDT 2022, Jason A. Donenfeld wrote:
> 
>> Hi Konstantin,
>>
>> On Tue, Jun 21, 2022 at 02:29:53PM -0400, Konstantin Ryabitsev wrote:
>>> If there is someone who is willing to compile a definitive list of "Linux
>>> Kernel commit do's and dont's", then I'll happily stick to that.
>>
>> I dunno about a "definitive list". But it seems like a lot of
>> conventions get solidified by way of tools that are ironed out over
>> time. For example, every time a code style discussion comes up, Joe
>> Perches arrives on the scene to make sure checkpatch.pl is current. And
>> now the clang-format file is starting to also accumulate collective
>> preferences. It seems like b4 is pretty widely used and will eventually
>> serve a similar purpose if it doesn't already do so.
>>
>> Anyway, in lieu of a complete and thorough list of all of the things, it
>> seems like in the last week or so we at least have two things that can
>> be be reflected in the tooling:
>>
>> - Don't add `Link:` if the URL hasn't been hand selected as being
>>    particularly relevant; the lkml patch email alone doesn't cut it. This
>>    suggests that automatically adding `Link:` is invariably wrong, since
>>    automatic != "hand selected", so maybe there's no point in
>>    `-l,--add-link`, and you can just remove that option.

Please no...

> FWIW I find it very helpful to have the lore-Link in patches, as that
> allow me to quickly find and share a pointer to already landed
> patch/patchset - in particular when the recipient doesn't have
> linux-next synced and checked out locally.
> 
> And I don't mind there being multiple Link: tags to different resources,
> as the various automation use cases I've run into have been easily
> solved by just filtering the tags by domain...

+1

"Link: " addition has been very useful also for me several times when 
coming back to applied patches, even simple one carrying no real 
information at first sight.

Even the lack of discussion associated to a patch is sometimes a good 
indicator that the merged patch was not questioned or exercised enough, 
and we can easily realize this by following the "Link:" tag.

Not only it links to email thread at the time of patch merging, but as 
time passes, it could even link to a discussion that happened *after* 
that the patch had been merged. This discussion can address regressions, 
remarks or request for follow-up. As developers, *easily* following this 
"Link:" brings value in my opinion.

[..]

Best regards,
   Nicolas

-- 
Nicolas Ferre
