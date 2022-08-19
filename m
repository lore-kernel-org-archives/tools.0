Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2181133C5
	for <tools@linux.kernel.org>; Fri, 19 Aug 2022 21:00:20 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id r16so6447653wrm.6
        for <tools@linux.kernel.org>; Fri, 19 Aug 2022 14:00:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=conchuod.ie; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=kFHVGZqsDx58sBD5Z0GjWgmKfNIVee9bAzga7inifRk=;
        b=DNWv+k+KRi9qR8fQ5j0FyjAjkgvG53d5Cr6o/fe3EDFhH4Su6P7Kcwq66xjZuIGld2
         UjHzhXBYmFSpv+9W2bNst08RUEoFkRP31L+Od1Bg0+BMLF6MF6FEk4I+7yMO8UjoVqO+
         j7QsHtGoeEw0XBIA32+Z0vwPkMF913iwfxv/e56VQBhI6RxL0Pw6GTM0LS+beTXqARE5
         uus6NNmzzYPb+qjmoMWBylhtAvEUYm8WuGZ2TlCcLByxVoSgHHW/445c9Wk18U256pee
         M79ugiyjhJzz+hxXnupYgAQI3TXR2vXwAzfAZqmzcvRVeLcW7hrjvq2zKqjXv1FeXbNp
         EhOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=kFHVGZqsDx58sBD5Z0GjWgmKfNIVee9bAzga7inifRk=;
        b=U2scl107OjRUxELOf5jIKy/mcAUP++Q++D4sW51bzavYWHbe3SIWVXhPYQim6IWkub
         zAVxE+7SZDynv1bPkYfcDt7YxywOJQovzSEV9wBGOgvMFa2q5CmhewmZQExmIM7Z9hAr
         D61wBRI4Awpicjf6ErJtnC98JakWr36PQicPEmGTSJ0hikWkmJAHwX0FexGt9MrGXPUn
         iJUNkgBpKz45emm1UAHLzmj8jTiVJ5+JiRmpfyggvo6xTUx+60IQg9Ag6MoEASbTfVGe
         sGiM2/a9OUAYmxZxcxGZjHMCL1KcxEL0cKY6L1hvd1DzyMfeTFuyTetkvB4hngwCaiF6
         UYLg==
X-Gm-Message-State: ACgBeo2P/6hab9DAhYeewLf9ZS2bv/4Fc1NHT/L+3BMHN/EkncEMBiJv
	7p3UfXf6s9VZDo88k2WY0jlt1u173s6zqSso
X-Google-Smtp-Source: AA6agR7XwNO3I3Z7lOy4Kgas89mtkd6mx4FIq/4QmZsUGF6zIElq3ThdsPdqdQEsdtuneunRatt9vg==
X-Received: by 2002:adf:f909:0:b0:225:c35:8242 with SMTP id b9-20020adff909000000b002250c358242mr5044017wrr.550.1660942818270;
        Fri, 19 Aug 2022 14:00:18 -0700 (PDT)
Received: from [192.168.2.222] ([109.76.58.63])
        by smtp.gmail.com with ESMTPSA id n12-20020a5d420c000000b0021e4edba1e5sm4812063wrq.111.2022.08.19.14.00.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 Aug 2022 14:00:17 -0700 (PDT)
Message-ID: <6cfc53ec-9ed2-ef07-80dc-09b50f4328a0@conchuod.ie>
Date: Fri, 19 Aug 2022 22:00:16 +0100
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
 <e2ca58f1-3c10-0dc6-ebdb-3ca088b430d7@conchuod.ie>
 <20220819204304.42w2ctexcrhnw72p@meerkat.local>
From: Conor Dooley <mail@conchuod.ie>
In-Reply-To: <20220819204304.42w2ctexcrhnw72p@meerkat.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 19/08/2022 21:43, Konstantin Ryabitsev wrote:
> On Thu, Aug 18, 2022 at 08:30:03PM +0100, Conor Dooley wrote:
>> Apologies if I am missing something that (should) be obvious here.
>> I am trying to use "b4 trailers" to update a local branch that was
>> not created using b4. I ran:
>>
>> b4 trailers -u --trailers-from 20220817201212.990712-1-mail@conchuod.ie
>>
>> It took 5 minutes before I got any output from b4, so I actually
>> began writing this email in the meantime as a bug report...
>> It eventually worked, outputting:
>> Calculating patch-ids from 16806 commits
> 
> I found the problem that was causing this to happen -- there was an off-by-one
> logic bug when we were looking at the non-contiguous ranges. In your
> particular case, we were running:
> 
> 	$ git --no-pager log -F --committer=conor.dooley@microchip.com --since=3.months --format="%H %P" --no-merges
> 	2e80b31e5fda2503b96cf810c827fd22eef71a3c 31b809d2e455925a3d13ef4bfed62dac13ba45be
> 	31b809d2e455925a3d13ef4bfed62dac13ba45be adbeff44dcd5989a6508dfc3aa1c7f549bdea9de
> 	adbeff44dcd5989a6508dfc3aa1c7f549bdea9de e620e1db41c2d5a9024b12d24db1e86fa55e3fe6
> 	e620e1db41c2d5a9024b12d24db1e86fa55e3fe6 568035b01cfb107af8d2e4bd2fb9aea22cf5b868
> 	88d319c6abaeb37f0e2323275eaf57a8388e0265 3f8ccf5f1a8c349364055b73caf1bb0314229976
> 	efa310ba00716d7a872bdc5fa1f5545edc9efd69 5e757deddd918edb8cb2fdb56eb79656ffc6dade
> 	3f8ccf5f1a8c349364055b73caf1bb0314229976 294b2111ff1027a942c362d523b847d73d91b70c
> 	5e757deddd918edb8cb2fdb56eb79656ffc6dade f2906aa863381afb0015a9eb7fefad885d4e5a56
> 
> The goal is to find the most recent contiguous set of your own commits and use
> that as the base for lookups. In the above output, the break was here:
> 
> 
> 	2e80b31e5fda2503b96cf810c827fd22eef71a3c 31b809d2e455925a3d13ef4bfed62dac13ba45be
> 	31b809d2e455925a3d13ef4bfed62dac13ba45be adbeff44dcd5989a6508dfc3aa1c7f549bdea9de
> 	adbeff44dcd5989a6508dfc3aa1c7f549bdea9de e620e1db41c2d5a9024b12d24db1e86fa55e3fe6
> 	e620e1db41c2d5a9024b12d24db1e86fa55e3fe6 568035b01cfb107af8d2e4bd2fb9aea22cf5b868
>     -- 8< --
> 	88d319c6abaeb37f0e2323275eaf57a8388e0265 3f8ccf5f1a8c349364055b73caf1bb0314229976
> 	efa310ba00716d7a872bdc5fa1f5545edc9efd69 5e757deddd918edb8cb2fdb56eb79656ffc6dade
> 	3f8ccf5f1a8c349364055b73caf1bb0314229976 294b2111ff1027a942c362d523b847d73d91b70c
> 	5e757deddd918edb8cb2fdb56eb79656ffc6dade f2906aa863381afb0015a9eb7fefad885d4e5a56

Right, these are all committed by me & included via PRs.

> 
> When I tested, there was only the single range of commits, which is why it
> worked in my tests. However, in your case there are two sets of contiguous
> commits,
> and we were using the wrong one as the starting commit (the next in
> line). So, instead of a nice selection of just 4 commits, which we wanted:
> 
>     $ git rev-list e620e1db41c2d5a9024b12d24db1e86fa55e3fe6~1..2e80b31e5fda2503b96cf810c827fd22eef71a3c | wc -l
>     4
> 
> We ended up doing this:
> 
> 	$ git rev-list 88d319c6abaeb37f0e2323275eaf57a8388e0265~1..2e80b31e5fda2503b96cf810c827fd22eef71a3c | wc -l
> 	16806
> 
> And then calculating patch-ids on each one of those. I'm shocked it only took 5
> minutes.

This is not even an especially great machine either, just my home server with a
couple generations old i5 etc.

> 
> The fix is in master.

Sweet, thanks!
I'll give it a whirl & let you know if I run into anything else.
Conor.
