Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1586F8C0C
	for <tools@linux.kernel.org>; Wed,  2 Aug 2023 15:54:17 +0000 (UTC)
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-40ddc558306so29211801cf.2
        for <tools@linux.kernel.org>; Wed, 02 Aug 2023 08:54:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1690991657; x=1691596457;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=TOKC7fuy3xrA4HahX8+dakB3K7jxRoCeLmH7oUakS90=;
        b=GuSfoBmbw06flvG/ZuIIge12bE8bo+Zg8rEygmgdWKG8C/YXTgOXxpeTeXajEuDFRq
         OWBLzxScmV6DlPb9Akz+d7GoslKwBA1kKzYukkKDuvEc3LabzmEIhMakUhEpEXYtcLnF
         hLVOaCps7fOgC+36wykiue6CHn4InvzXTMfCk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690991657; x=1691596457;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TOKC7fuy3xrA4HahX8+dakB3K7jxRoCeLmH7oUakS90=;
        b=fNYqe9xzTYP2FfXcTr6aa3n4gXA7TJ+mkbUeNrEEvhLYHmy4XxghO1okZIYEnLTd/H
         3ssJwIpIQ0QcyQXp4b9WM72/4mk1MTgRE/VPrH2Yv1VOaoI0BwKzoZz4mzAU33vxUYbQ
         1qwi3dJGAJzoiko01lQsK5SJi+OmCfHc6AzSb6FdYasTf2TsMlHHotNJsuK+B+0qG38H
         TCvF0ZSXU3G5gmYczDzXc0G9okJw7uGjyJrXLIc6n5/qlu6H7f1emu/OjvGsDflUdWuL
         Rqvsx27B1ujeutGDWI+X/B4dWcCAMTtoQg+OYYPNpichz1KEL+I5wW0nIFFiXSgI3kvP
         zYbw==
X-Gm-Message-State: ABy/qLbZkg/uyrZrINgiVOgAbXIB2e/+UV64Oq5Qu+WVK3SmSOUQHpoy
	9Dbhxt4gFN507KRFWbQDOrmQNg==
X-Google-Smtp-Source: APBJJlHhn8bOJ1cMheZPHdneLM1IBohfW5IQqKVR87s7RmPs/12MzNGh+/csgkvqU/QA3x71ba8U/Q==
X-Received: by 2002:a05:622a:1107:b0:403:a9d3:91e3 with SMTP id e7-20020a05622a110700b00403a9d391e3mr21562208qty.32.1690991656867;
        Wed, 02 Aug 2023 08:54:16 -0700 (PDT)
Received: from meerkat.local ([142.113.79.114])
        by smtp.gmail.com with ESMTPSA id k4-20020ac80204000000b00401e04c66fesm5510374qtg.37.2023.08.02.08.54.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Aug 2023 08:54:16 -0700 (PDT)
Date: Wed, 2 Aug 2023 11:54:07 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Chuck Lever <chucklever@gmail.com>
Cc: users@linux.kernel.org, tools@linux.kernel.org
Subject: Re: Most of my "b4 am" runs fail the DKIM test
Message-ID: <20230802-snowsuit-quizzical-95f660@meerkat>
References: <CAFMMQGt=-0HRpmb+fD0e_LVeZ_TPr-8QEPnorAkffrVOowb4dQ@mail.gmail.com>
 <20230802-failing-cheer-6f381c@meerkat>
 <CAFMMQGs6Mt-19JJCOtSPDicONDBOEf5jw2yrixv6PZruPRUiPA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAFMMQGs6Mt-19JJCOtSPDicONDBOEf5jw2yrixv6PZruPRUiPA@mail.gmail.com>

On Wed, Aug 02, 2023 at 10:57:35AM -0400, Chuck Lever wrote:
> curl -s https://lore.kernel.org/linux-nfs/5b0eff4e3ef9bf9621f5095189933f60def40f0d.1690569488.git.lorenzo@kernel.org/raw
> | dkimverify
> signature verification failed
> 
> A DNS issue makes some sense; I've made some DNS/firewall changes here recently.

The following should succeed for you for DKIM to work:

    dig -t txt k20201202._domainkey.kernel.org

-K
