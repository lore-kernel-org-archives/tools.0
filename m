Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A73AA7E1
	for <tools@linux.kernel.org>; Tue, 27 Sep 2022 09:34:08 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id o20-20020a05600c4fd400b003b4a516c479so5101189wmq.1
        for <tools@linux.kernel.org>; Tue, 27 Sep 2022 02:34:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=t8JG3emlLH9vVF8ksycqCfDqLoVAzF8OEzIko5ATrvE=;
        b=JAPsLmUc5f9rcYUBPZu/fa+gdQAvAzPKZFmz1vySe98y9uOdS3wtCKVPj+704oPhgC
         ZeF47Yirimb20k2uiLHMkg3+gCqO37TkBamAh6TnAc12ts4PXQB7WmioGP7UBqCaJW62
         oDnmzUT6PNP1lYR38dLYzyd0q+x0XPhzdOT/XhizTO2BKSLaGwTp4Xhp+a/FANiP/S9E
         Idf1SCplYmlcQ+rJq9NTqUzyeufwLfZvMjkypM+66dFewDh1em9mGCOeJxO4p4T8oLB1
         jFhFlYyypEk7UC3HS56Xy373SEur3ePnyjH353X78sLHHVeOCcc2K/7K4v92u113H388
         xYDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=t8JG3emlLH9vVF8ksycqCfDqLoVAzF8OEzIko5ATrvE=;
        b=ffukOOES3NlqsIYidSlJzBn6TwNoRKqytktieCg8K892lkd5Fu+Go3PnDR3DgjE+Q0
         N90kYQI/zp7bL3VRqjwz57+NK4UryRjyMdVLhs1Yypuil+TTAxDsazsHEpgTkRu7oiq7
         aOxCrzYL+5hgqFQGTdqgn5Eyy0y39WYl0zjAsjyM28YFaeSw04/PEJqiB3krIhjk8cJK
         ZKuNbEU+mWDqqAfn0hnP020wCJRJ5yZfOthzSKqSgPmiGD+y9sjoUIIdxSLwc+lRWuBZ
         07x/dRsEBJRltruUa83fXILG5BfRK6MSiICuWQjhmWLXZ66gYTGYR2b4nO9h4Fhtvh7V
         5lnQ==
X-Gm-Message-State: ACrzQf2OuXlmVez0WmLtNSVbMaJeZ3VyzEn4jfsaUmekY7i3Rpcn8FWJ
	7Q0v/i3Q+s8hd+mD7B5YekC3AA==
X-Google-Smtp-Source: AMsMyM7LCVE+yKS4PeuZFtNXfaUSkJqeHwIMpmc5NHcRJzmuDt16dxuVsRKFQek0KWPBUgk6ExI+Cw==
X-Received: by 2002:a05:600c:221a:b0:3b4:75b8:3f7f with SMTP id z26-20020a05600c221a00b003b475b83f7fmr1844413wml.175.1664271246750;
        Tue, 27 Sep 2022 02:34:06 -0700 (PDT)
Received: from [192.168.0.20] (210.145.15.109.rev.sfr.net. [109.15.145.210])
        by smtp.gmail.com with ESMTPSA id c11-20020a5d528b000000b00228dc37ce2asm1250665wrv.57.2022.09.27.02.34.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Sep 2022 02:34:04 -0700 (PDT)
Message-ID: <5eb13320-bbc6-42ff-9161-24b789292098@baylibre.com>
Date: Tue, 27 Sep 2022 11:34:02 +0200
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: b4 cover-letter in single patch submission
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: tools@linux.kernel.org
References: <3b1af982-83f1-d5ed-6df1-c654df481899@baylibre.com>
 <20220922180119.jnggtlpwu5yhxoc7@meerkat.local>
Content-Language: en-US
From: Amjad Ouled-Ameur <aouledameur@baylibre.com>
In-Reply-To: <20220922180119.jnggtlpwu5yhxoc7@meerkat.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Konstantin,

On 9/22/22 20:01, Konstantin Ryabitsev wrote:
> On Wed, Sep 21, 2022 at 02:23:18PM +0200, Amjad Ouled-Ameur wrote:
>> Hi,
>>
>> I would like to open a discussion regarding b4 tool. I read in the b4 doc
>> that it will always include a cover-letter even when sending a single patch
>> [0]. This is regarded as a proactive feature in case the submitter is later
>> asked to split up the single the patch to many patches.
>>
>> However, this can upset maintainers and reviewers when a single patch (that
>> does not need to be split up) is sent with a cover letter that would
>> probably contain the same title and text as the single patch.
>>
>> My humble opinion is, adding a cover letter to a single patch should be an
>> optional feature.
>>
>> In this case, it might even be convenient to keep the change-id and
>> changelog in the patch's comment section.
> I agree, I never really liked forcing the cover letter on a single-patch
> series. I've committed the initial implementation of mixing in the contents of
> the cover letter into the patch basement itself. The implementation is not as
> clean as I would have hoped it to be, but it seems to do the right thing in
> most of my tests.
>
> Please try it out and see if that's more like something you were thinking.
>
> I'll backport it to 0.10.y as well.

Thank you for taking this into consideration, looking forward to using 
v0.10.1 :)

Regards,

Amjad

>
> -Konstantin
