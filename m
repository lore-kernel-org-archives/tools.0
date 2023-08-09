Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com [209.85.167.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9832F18AE4
	for <tools@linux.kernel.org>; Wed,  9 Aug 2023 16:50:12 +0000 (UTC)
Received: by mail-oi1-f181.google.com with SMTP id 5614622812f47-3a3df1ee4a3so4155904b6e.3
        for <tools@linux.kernel.org>; Wed, 09 Aug 2023 09:50:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1691599811; x=1692204611;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=He4IvUcYyIKK2RGPWRy7aXvjheVu5viAkGNtt/+Ke8E=;
        b=xBTpEF3zpYUq+bjikeX7zSzA/ywa4MrIaUSU74cTEQVvb2kfDdc2Ur+agpsIOxiWnj
         vchYSEhe6u1Fuz6izzgZMbW99gKgXEwyq5FyeO81G5FstwNSDtsIlRr0cW8u53yTCYwj
         gDDBlqWllJddw+qUmhbo06Ia6R3LJDrTZ2hJiWt7recqMyTPuyrgxExNLV4ZosVQS0M+
         wLTdbz7Qt3XFpRXR2d+vg/tuU6O6K7koKTaManMKKYaQS0uSfohiaHAhrzG95P+n3bQv
         9hBg5FJCA6VmKfBIRWtr8p1CEDhtmlGIbquKvfs1gGzha1NJ2oRv0fU4CxrHFE1r0nal
         VzeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691599811; x=1692204611;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=He4IvUcYyIKK2RGPWRy7aXvjheVu5viAkGNtt/+Ke8E=;
        b=YTfWHygXq012sJPFubJd6RSh5VvubGFsusRTsfNpqmrZFKY6Qg22O6SZk0K9XzCzE9
         YwUcqqNK1maYJ6WP0i6OXKYGaxMJtvWiyCzDAvS2Mt2tk/ilFY/18hRO+IAcZ26s4ko2
         3aEZJgxC5hN782pF9IvNIfaa/RFJk1AEY1TpSll7ZB2aVBk/fZ2mHtTICSO2KGePvB8w
         cT25KJTEJpSWf978iUG8pH+U/82nVEZOc6zZLI+UInHDfWzftd0dFMFYmzA1w9PblJ0b
         CKbksd9+tMlhp5/dTnr5BzYlCH7k9F+yN/ND8Zz92CXpMaXx/5w7PNco72S1yyH6kFKY
         Gz1g==
X-Gm-Message-State: AOJu0YzaxoK33V++l2LJW4FIh4I2qsR2fPnDYHdywzTXzBEvOLqWXkD/
	5wZP0OxIScSYbn3jy5951ugxZoJGYd8DrlyiShGz1Q==
X-Google-Smtp-Source: AGHT+IH3CHHnMNfpdOqa4g0/dtp+71gOteaQ08Cs0j+UAFIHskfWfZjHpskTSdvYCFsDCMkWf9ptsh2Hp7Wba1RmRpg=
X-Received: by 2002:a05:6808:3a97:b0:3a7:7bea:d3cc with SMTP id
 fb23-20020a0568083a9700b003a77bead3ccmr3417956oib.0.1691599811381; Wed, 09
 Aug 2023 09:50:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Wed, 9 Aug 2023 09:50:00 -0700
Message-ID: <CAKwvOdmOVnhKws_6DdakK9SDxiCCCR1d6VJwvz94Ng_y3V8QCg@mail.gmail.com>
Subject: get_maintainer, b4, and CC: stable
To: Joe Perches <joe@perches.com>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
	"Kernel.org Tools" <tools@linux.kernel.org>, "# 3.4.x" <stable@vger.kernel.org>, 
	LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Joe,
A recent mistake I made when using b4 was that I added a fixes tag,
but forgot to Cc: stable in the commit message.

Speaking with Konstantine, it seems that b4 may just be importing the
recommendations from get_maintainer.pl.

I suspect that either b4 or get_maintainer could see the Fixes tag and
then suggest to Cc stable for me.

Should get_maintainer.pl make such recommendations?
-- 
Thanks,
~Nick Desaulniers
