Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45F782F21
	for <tools@linux.kernel.org>; Tue,  1 Feb 2022 15:55:47 +0000 (UTC)
Received: by mail-qt1-f175.google.com with SMTP id z1so13620396qto.3
        for <tools@linux.kernel.org>; Tue, 01 Feb 2022 07:55:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=ruu1THbL2naXPqFGHbBjhY1Gugs2i2221HNoESpDuM4=;
        b=KMD95XQWUHY+YPl6dBhgvkBV/QjGg+trV1XfRZ/O7uC2ySoqqwiE/lOHHAZ40tv8iv
         /lAQ81V+g1hIIl2+hj8KasOoHfqSU2RLWGPCGJWnAR3KCo70KDAmlFinoJdvbYEoEbfS
         Gt4MfngUPDxQj7USHZEaGPVRUHPNon/6bryK8IO4da2qM0jHBaYcNGgfjzxBk7TbRTj5
         0jIIclBC4HzdTCXkRT6oAGzK9Ve4Y/aoVzLr/rxJNlC6syQxY9VFTrq6HpvRvl0axwOO
         m75YWpyeBkMnPIuWiUjx4ZKGkAIMDR6bdEOf3zvTMpWwChfuvMItQFGyIIXoCPwySt67
         7hPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=ruu1THbL2naXPqFGHbBjhY1Gugs2i2221HNoESpDuM4=;
        b=BfjSaZmK4YUtysw96j3PpUosN96BIHBgyzGCXjG+IZhJAPghgTjkQXmILaumvEteGk
         BrRZsab7rilj2KXzSDAIl+XxZRrnZH0PiYOJLomjK+yXNbn7q4p2MJ7TYE88WhyiC783
         ge8ShPZMZOpGXimJ0pXRBwoLhl7WezmmsM7s8eYEIEbc6N7L6MQ6XAcyD2buuNVjzBIa
         SsV5k4ltgG/79SM8UZCHZILAlLbY8sBu8H3epYPs5Vuk7/hLmTrw4DI1y2NUk7mmlbzo
         50+nLvWgYax1ybbOJFmtX6Zx16g+BbSCVOiLQZ01eaUBbV6CKDe0G+WO12qf7nk1m1vU
         N9LA==
X-Gm-Message-State: AOAM530fBJlD9HJ2gmuDwAVgGqsFTom6hqItC61+1seBv+aL+Sj600YF
	7//Y38L47hjiE/DhiUT737m5NHUdOPEaBmiU4yH3tGwEsDs=
X-Google-Smtp-Source: ABdhPJzy6rNpfAz/o+9+AOa+/m0jWkyVzswy2n4AvBdwoG6UbJj1IGcAsWTDPDkcbubruxGEma0/Moh2rNspUjWKygg=
X-Received: by 2002:a05:622a:164a:: with SMTP id y10mr19606878qtj.629.1643730945885;
 Tue, 01 Feb 2022 07:55:45 -0800 (PST)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 1 Feb 2022 18:55:35 +0300
Message-ID: <CAA8EJpoA_Krn02zokkAXBGEqrhR0MBQnScSWrzWySci+z2UAVA@mail.gmail.com>
Subject: b4 tool and Gmail handling of sujects
To: tools@linux.kernel.org
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>, 
	Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"

Hi Konstantin,

Thanks for the b4 tool, which we regularly use.

A small request/suggestion from our team:
Could you please make the insertion of the '(subset)' token (into the
email subject) configurable?
We noticed that always inserting it into b4 replies breaks threading
in GMail, which is annoying to some of our contributors. Thus we'd
like to be able to turn it off.

-- 
With best wishes
Dmitry
