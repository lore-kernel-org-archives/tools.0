Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4F7F7B
	for <tools@linux.kernel.org>; Thu, 18 Aug 2022 19:30:06 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id k17so1324646wmr.2
        for <tools@linux.kernel.org>; Thu, 18 Aug 2022 12:30:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=conchuod.ie; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=8+WNlnmiveKh8xvEFOgrChECrtRw+B4A8kAYPW0WCV4=;
        b=eaxUDaP+G0CmlW/XtoQ3yJ46t2rDrCoS+Hl3pJ25LrQvR1ZQz/EODIO2NXXB+gi+kL
         +Jh7FWjQ4HdT82ZnKahmcKl4M89rD82xg/jeXtyfxq3733yE0eclHx31fqNhejg0xdKn
         51EZiJ8S0MbGOHa49GMpSTniNYpZB2TS3fnZdsk97Yy5N2wEK2ZBQjBQi8914FS6Pw1h
         ko4rH55mgLUTG8U7qZEvoOWaphENd/QZDnGqUwA+JlP2eSRTOWhA+JdLT22r6Jc0uPFS
         VVyUuFc2vZZH4f/Tta03y/tMIzs8ypnrX43ccBt0CWCI3GHaJOTQZQVBbvhG9OTtu2kr
         9s5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=8+WNlnmiveKh8xvEFOgrChECrtRw+B4A8kAYPW0WCV4=;
        b=OSA9uiQkf5iQohKwDRIeMdSSipZoq5Oni8wqjS51YMrSle+Y9sUPae41wwGEXfHd4l
         yicdP1T5s324m0lx0BXduOmgZB4AMnnlDgmXU/Ldq5ERIWyDqWRNFo0FFcVxbrPDr02u
         if4tzW29FHu82xfzxreB8mgpxtbmOVK+vzQTBk1hxV2y9YOF5n9Jzt1yr+M7VLrjOJNj
         EvhZQVWUdN5nQb5SaQSM5LXNdlyd7UgmRwE0K1sPl0+bZCvkq2To/ghNtiBGoKSSDZO9
         vdqcWj/BcKxtl4/J+6iaep6sAHCUCKMaQYZZRM7ithDHNAD1871T/weAbr0X5NKTUwEJ
         0MyA==
X-Gm-Message-State: ACgBeo0QSojbFw0suAeH8Bm9xS46v7rHh2zpZKCGQUajURg12d3KPh9t
	RKWXj9MJiNk5skylhTQbgAOuiQ==
X-Google-Smtp-Source: AA6agR6JanPKk0abRpwVHU/oENOVkDSz7lKrwgzYDLKWdtKryLnoynQRn1PDd6TrJfWSUDXOhkbB8A==
X-Received: by 2002:a05:600c:1546:b0:3a6:a99:aa7 with SMTP id f6-20020a05600c154600b003a60a990aa7mr5750646wmg.109.1660851004929;
        Thu, 18 Aug 2022 12:30:04 -0700 (PDT)
Received: from [192.168.2.222] ([109.76.58.63])
        by smtp.gmail.com with ESMTPSA id j4-20020a05600c300400b003a601a1c2f7sm5790349wmh.19.2022.08.18.12.30.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Aug 2022 12:30:04 -0700 (PDT)
Message-ID: <e2ca58f1-3c10-0dc6-ebdb-3ca088b430d7@conchuod.ie>
Date: Thu, 18 Aug 2022 20:30:03 +0100
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
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: users@linux.kernel.org, tools@linux.kernel.org
References: <20220716142954.voq4ucnl5wkq7h2b@nitro.local>
 <20220720184835.uhnkucai54alhgo6@nitro.local> <87pmhs1d8h.fsf@baylibre.com>
 <20220726142743.dllhmbivtb2yk4uk@meerkat.local> <87bktbapri.fsf@baylibre.com>
 <20220726205653.yjmafga3utcwjef7@meerkat.local>
From: Conor Dooley <mail@conchuod.ie>
In-Reply-To: <20220726205653.yjmafga3utcwjef7@meerkat.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hey Konstantin,

On 26/07/2022 21:56, Konstantin Ryabitsev wrote:
> On Tue, Jul 26, 2022 at 04:54:09PM +0200, Mattijs Korpershoek wrote:
>>> I think that makes it hard to distinguish from "b4 am/shazam" that also
>>> operate on series. In my mind, the command should indicate that it's
>>> specifically for working on series for submitting them upstream as opposed to
>>> for retrieving series for inclusion into your repos.
>>>
>>> Perhaps "b4 prep"?
>>
>> Understood. series is indeed ambiguous and "prep" or "prepare" seems
>> more appropriate.
> 
> Okay, the latest master should have all this work in place:
> 
> - b4 prep
> - b4 trailers

Apologies if I am missing something that (should) be obvious here.
I am trying to use "b4 trailers" to update a local branch that was
not created using b4. I ran:

b4 trailers -u --trailers-from 20220817201212.990712-1-mail@conchuod.ie

It took 5 minutes before I got any output from b4, so I actually
began writing this email in the meantime as a bug report...
It eventually worked, outputting:
Calculating patch-ids from 16806 commits

Would it be possible to add some sort of "working, this may take some
time" message so that others don't think it is hung like I did?

Delay aside, it worked "perfectly", will use it going forwards, thanks!

Conor.

FWIW:
b4 --version
0.10.0-dev-c53d8

> - b4 send
> 
> See --help for each of these subcommands. The only notable change other than
> that:
> 
> 1. `b4 prep --format-patch somedir` will output the current series as patches
>    in a format very similar to format-patch (no To/Cc auto-population and
>    minimal headers)
> 2. `b4 send --dry-run -o somedir` will output the messages exactly as they
>    would be fed to the SMTP server
> 
> You should be able to git pull and continue with your existing series. Thank
> you for your feedback -- please let me know if something else can be improved.
> 
> -Konstantin
> 
