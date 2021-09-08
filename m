Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEC9672
	for <tools@linux.kernel.org>; Wed,  8 Sep 2021 09:46:57 +0000 (UTC)
Received: by mail-pf1-f182.google.com with SMTP id e16so1565239pfc.6
        for <tools@linux.kernel.org>; Wed, 08 Sep 2021 02:46:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=14wPdEceYiWTE4wSvlgB71W7OZfgaa8OFvtrPFOk+RU=;
        b=kOYzv2HQZsR/T7s77RBRy5wBTyLlPNENB1zYJfD2u0UvRsLvTuASQdJKw7pk1+H2RN
         sssYAbCpWTjmjdXTgel52e4lRHheKKr08+eGMBIO1/PYXNJ+JRFDKjGwA+o3RmmSnfNX
         qERHdzRN6Np5lWEQcb5bBqiQ4/C/BrWE7u3fYSt/I+NUjjVIsUlfA1SzJVibHOIj6qGa
         TOS1LVqJS1k/Mt/hYxf8Xw1yw4hrIt1o1xsZoA+gzoBU7aRL7S+89jw5GH56PRKabBux
         ESJXm/tj+7kJjlgR0YXcaggqNUVQTuQMM/Jd457g9NFqbjJrPpJ2yMLtTqkz602tc6DR
         pXTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:cc:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=14wPdEceYiWTE4wSvlgB71W7OZfgaa8OFvtrPFOk+RU=;
        b=LG1YeOI7p9PdcQIbVu29TIxpwOZ6nzlxnsZfe4m7L7BLV+Zhuju6LXbBjrJDOX0VBo
         UqPKENkXGTpEIpYjjLvr2P6Y0FmmAaviZ2AS436266DXirNmEeFcBSV4ZMiWbU7s5GZs
         Zk3Z7o00kxg7FgdjsSknfEoohcSItXm0sN5OOUpEMsGgOcdyNLoCvRx01qBvt/zSGrHE
         ka5CI3MrRQl+MN/b0bujm0OWjmn88S0BICQokDqWa/AYP9j3+t2gCHXmboOAvQxFPg+P
         Tjj6Z1qIdu9bwVUL5a0jNgY6SpqWSerU2SgdGcielgLhBpmdyDTg2sdEZruFnVkoAA1C
         ndrw==
X-Gm-Message-State: AOAM530ZZ3tG5z7xU/W4iY+XQcikBTxaWI8aoXiWkGD1LSadHbFfHhfG
	1aDjnKpdimR9to40iRrikaZM2UOwWGIntQ==
X-Google-Smtp-Source: ABdhPJxphCiocD3eorsHyX5lwYCjiVhhBKvBgcF3m81eK3PLnD9uIsbR/Ftr2U21D+YR4pEkNwac2Q==
X-Received: by 2002:a62:a513:0:b0:3f1:e19c:a23 with SMTP id v19-20020a62a513000000b003f1e19c0a23mr2830230pfm.43.1631094416849;
        Wed, 08 Sep 2021 02:46:56 -0700 (PDT)
Received: from [192.168.1.6] ([117.98.200.228])
        by smtp.gmail.com with ESMTPSA id a21sm1585055pjo.14.2021.09.08.02.46.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Sep 2021 02:46:56 -0700 (PDT)
Cc: saurav.girepunje@hotmail.com, tools@linux.kernel.org
Subject: Re: b4 and lore and '/' in a message id
To: Greg KH <gregkh@linuxfoundation.org>,
 Konstantin Ryabitsev <konstantin@linuxfoundation.org>
References: <YTcJNrbjTVMXCQUG@kroah.com>
From: Saurav Girepunje <saurav.girepunje@gmail.com>
Message-ID: <22538765-8ad4-6150-200c-a1f4eb0830f0@gmail.com>
Date: Wed, 8 Sep 2021 15:16:53 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
In-Reply-To: <YTcJNrbjTVMXCQUG@kroah.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 07/09/21 12:09 pm, Greg KH wrote:
> I've run into problems with a specific user that happens to send patches
> out with a '/' in the message id field.
> 
> I think this is a valid thing, but b4 and lore don't seem to handle this
> very well.
> 
> Here's their latest patch:
> 
> $ b4 am YTRuXTu/kePBDwAF@user
> Looking up https://lore.kernel.org/r/YTRuXTu%2FkePBDwAF%40user
> That message-id is not known.
> 
> And yes, if you go to the above link, it is not found.
> 
> But, if you go to 'all' it is found:
> 	https://lore.kernel.org/all/YTRuXTu%2FkePBDwAF@user
> 
> Any hints on what to do here?
> 
> Note, this is the second time this has happened.  First time I wrongly
> blamed the developer that they submitted the patch incorrectly, this
> time they graciously pointed out that they had sent it correctly,
> something was wrong with my side :)
> 
> Saurav, how are you sending these patches out, using 'git send-email' or
> something else?  What is generating that message id?
> 
> thanks,
> 
> greg k-h
> 

Hi Greg,

I am using mutt to send the patch. Below is muttrc settings.

unset use_domain        # because joe@localhost is just embarrassing 
 

set realname = "SAURAV GIREPUNJE" 
 

set from = "saurav.girepunje@gmail.com" 
 
                              set use_from = yes

I am using "mutt -H" command to send the patch and that is creating 
issue on message id.
See below link:
https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=833192

Regards,
Saurav Girepunje


