Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6967746BD
	for <tools@linux.kernel.org>; Thu, 18 Aug 2022 20:12:57 +0000 (UTC)
Received: by mail-wr1-f42.google.com with SMTP id h5so2134401wru.7
        for <tools@linux.kernel.org>; Thu, 18 Aug 2022 13:12:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=conchuod.ie; s=google;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=YUkrQKsYCJfE76JsDDQIWYfHGqw8PTMh7MpJFmVwYXE=;
        b=gBZXIShmXmkQGi7IHrL105BuxJM26eQbdgncugKygJIe8R9S7YrpurNVmbmRDZY2xO
         KU2P0qeMYXfCtK2DR35ps/LlFUYlMHkBWcLDfSlmaRYQWS/njxa8vbA8CeAKJYrdJ5vn
         U6aWmecn+eyQ+ydFZ1c8gEj37UPBRKHfo9ojikSxP9UavYgifucidZbrjvAsAcAh1VS9
         zMYYvJHzi4wdnv7EKjHSEP3PQWDdzJ3Ty3SotSZ8TakfjShoyPOHK5BpYo32VJvv5wBt
         HEz/s3ITvBSdBbMTFn5VT3Llcj0tEJNFu9cXt7M5RTyJQJ7b2bSVilvL9Wf7vYAODPMX
         SUMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=YUkrQKsYCJfE76JsDDQIWYfHGqw8PTMh7MpJFmVwYXE=;
        b=UaJCV9/PsL92lszT83S7XW939oTSQeO51dCgf7rfp6PK0nYk3XgvhvyjZCxFPHkOHI
         ZcgTTzLbUXjI5CdTWnmLJyRUAMmEy0oiN/lLbXYq33jD3hPsMkLcGQTMW6hM04LpIub1
         wiEg8hF48cc3GSyOegZIIW944QWgA6CSTTDE4sZbMay+T6vH85QastPRH8+fsegvtK1L
         y9Le5y+ClbUU/GNc8J7AKWu0xs7K8RXpuO6A5YqU0klPzm5a50jcKhe4E0CS6KXBxSW6
         akP/kt7+sN7YWg2JEeCXdjBX1mF+ecYZUlNyiLGG5ImE2PyYUSGWbHjcNkuL++qrpgji
         OdrQ==
X-Gm-Message-State: ACgBeo36kdjetmPCqHy2PD7f77AtiBNr6csxZuvlTqbSGeXZHcnHwv0s
	19V/ro+weps78ubXZ321FqK6P2NWPZxEo0+F
X-Google-Smtp-Source: AA6agR5JP5t3jYHortCGuQ7rX3Gn+1/INOCn8jyokGWSsLJpqQG5PnFk6OX5R2P5KW4bVc47xgcc3Q==
X-Received: by 2002:adf:f94f:0:b0:221:76ba:9559 with SMTP id q15-20020adff94f000000b0022176ba9559mr2453429wrr.571.1660853575439;
        Thu, 18 Aug 2022 13:12:55 -0700 (PDT)
Received: from [192.168.2.222] ([109.76.58.63])
        by smtp.gmail.com with ESMTPSA id p15-20020adfcc8f000000b002252ec781f7sm2336587wrj.8.2022.08.18.13.12.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Aug 2022 13:12:55 -0700 (PDT)
Message-ID: <e2198b0d-9688-099d-75cb-99a5bf12191a@conchuod.ie>
Date: Thu, 18 Aug 2022 21:12:54 +0100
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: b4 submit ready for beta testing
Content-Language: en-US
From: Conor Dooley <mail@conchuod.ie>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: users@linux.kernel.org, tools@linux.kernel.org
References: <20220716142954.voq4ucnl5wkq7h2b@nitro.local>
 <20220720184835.uhnkucai54alhgo6@nitro.local> <87pmhs1d8h.fsf@baylibre.com>
 <20220726142743.dllhmbivtb2yk4uk@meerkat.local> <87bktbapri.fsf@baylibre.com>
 <20220726205653.yjmafga3utcwjef7@meerkat.local>
 <e2ca58f1-3c10-0dc6-ebdb-3ca088b430d7@conchuod.ie>
In-Reply-To: <e2ca58f1-3c10-0dc6-ebdb-3ca088b430d7@conchuod.ie>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 18/08/2022 20:30, Conor Dooley wrote:
> Hey Konstantin,
> 
> On 26/07/2022 21:56, Konstantin Ryabitsev wrote:
>> On Tue, Jul 26, 2022 at 04:54:09PM +0200, Mattijs Korpershoek wrote:
>>>> I think that makes it hard to distinguish from "b4 am/shazam" that also
>>>> operate on series. In my mind, the command should indicate that it's
>>>> specifically for working on series for submitting them upstream as opposed to
>>>> for retrieving series for inclusion into your repos.
>>>>
>>>> Perhaps "b4 prep"?
>>>
>>> Understood. series is indeed ambiguous and "prep" or "prepare" seems
>>> more appropriate.
>>
>> Okay, the latest master should have all this work in place:
>>
>> - b4 prep
>> - b4 trailers
> 
> Apologies if I am missing something that (should) be obvious here.
> I am trying to use "b4 trailers" to update a local branch that was
> not created using b4. I ran:
> 
> b4 trailers -u --trailers-from 20220817201212.990712-1-mail@conchuod.ie
> 
> It took 5 minutes before I got any output from b4, so I actually
> began writing this email in the meantime as a bug report...
> It eventually worked, outputting:
> Calculating patch-ids from 16806 commits

(realised this may be misleading, it gave an normal output after that)
> 
> Would it be possible to add some sort of "working, this may take some
> time" message so that others don't think it is hung like I did?
> 
> Delay aside, it worked "perfectly", will use it going forwards, thanks!

Hmm maybe less than perfectly. I think I found a bug & have a few things
that I noticed.

Firstly, the option that am has for cover-letter trailers seems like a
it could be a good idea here too. The other thing is that the trailers
got added after my SoB, when I *think* that before is more correct.

I decided to re-run even though I had no updates with to see if that
might reorder my sob with:
b4 trailers -u -s --trailers-from 20220817201212.990712-1-mail@conchuod.ie

I think b4 then decided that all 16806 commits needed to have my SoB
added to them & proceeded to do that even though my series is only a
couple of patches, like so:

  wifi: cfg80211: use strscpy to replace strlcpy
    + Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
  wifi: mac80211: make 4addr null frames using min_rate for WDS
    + Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
  wifi: mac80211: fix mesh airtime link metric estimating
    + Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
  wifi: mac80211_hwsim: Support link channel matching on rx
    + Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
  wifi: mac80211: consistently use sdata_dereference()
    + Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
  wifi: mac80211: rx: accept link-addressed frames
    + Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
  wifi: mac80211: Consider MLO links in offchannel logic
    + Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
  wifi: cfg80211: Allow MLO TX with link source address
    + Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
  wifi: mac80211: Remove AP SMPS leftovers
    + Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
  wifi: mac80211: add an ieee80211_get_link_sband
    + Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
  wifi: cfg80211: add API to add/modify/remove a link station
    + Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
^CTraceback (most recent call last):

If there's anything I can do to help, please let me know.
I pushed the branch to:
https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git/ b4-trailers

Thanks again Konstantin,
Conor.

> 
> Conor.
> 
> FWIW:
> b4 --version
> 0.10.0-dev-c53d8
> 
>> - b4 send
>>
>> See --help for each of these subcommands. The only notable change other than
>> that:
>>
>> 1. `b4 prep --format-patch somedir` will output the current series as patches
>>    in a format very similar to format-patch (no To/Cc auto-population and
>>    minimal headers)
>> 2. `b4 send --dry-run -o somedir` will output the messages exactly as they
>>    would be fed to the SMTP server
>>
>> You should be able to git pull and continue with your existing series. Thank
>> you for your feedback -- please let me know if something else can be improved.
>>
>> -Konstantin
>>
