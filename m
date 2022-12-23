Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D24B323A2
	for <tools@linux.kernel.org>; Fri, 23 Dec 2022 17:01:17 +0000 (UTC)
Received: by mail-ej1-f48.google.com with SMTP id x22so13215583ejs.11
        for <tools@linux.kernel.org>; Fri, 23 Dec 2022 09:01:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=m6KnjZHEo8K8vCKcTHza+iWn+Xh/l/Bt+yXEuAA/iHw=;
        b=Wh3nskUWG0icn7xROUSypPacf7QWHnxTDW9aTio+B60hwH+wgH7aqEKshw65qZ5zDf
         c7yBkGWGfHsPruOicCYSOlNVcaPw8CkbXT3j9Uxe5t4uFDfPrUm09zgSHzkOufy8zmcy
         0S9c5jyw6XzSUepGvNvewDf+aUGD61jpoCjRpTiqy/TCgTpRhdmx1i7o2ANgDsr7/2Ur
         7Zc0u5/jF3L981uYvXQMz4Kf5ICppPw/t4c2yDXDmU0wTFnmt1CW33PzJzFVkC28hq0+
         eZoF6ROCFaI3pavsJsX2vOzYdaGiZ4fCyrFxOsJI+12sS9vCGt40Dd/8oeGJTdOqgrUH
         JDJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=m6KnjZHEo8K8vCKcTHza+iWn+Xh/l/Bt+yXEuAA/iHw=;
        b=WcCNcj6JZRkbM8IwGZtX4aBisojMi6DIM4iyWu3jO5ztfniDgrBBEq5HBzY+KsXL0w
         BG1o060WBcDp5U6SSnxqllko1qVc/utP0VtUkdDAFwwvOgHg37G59lZuk7fHy5AvqMM1
         LXvJttTnOJl9JYEh8j0VhrPsEQAe0RKKozJ3qO+LOR8BQt9WHf4l9NBO29GprSRZj/xs
         Q7AZYA1PSWRTaaj58fLgVsEeaeB2fbFbRkUkak/mvNtT17eBbn7o1POjiQGDueCmnXLX
         dTwldugZZiP5b6KZbFH+/a2lboPyQKJuf0Rmzr9VPsyYpAeH2JRAJ84GEyATEFKC6HHp
         lNpQ==
X-Gm-Message-State: AFqh2krRcN3a8SSKgZ2neSHanlOXaxo2cOX7EFaDUIuumYuGbr0HmT01
	ujoYT4V2rQvHRVXxzjGasnFXpw==
X-Google-Smtp-Source: AMrXdXsuvVMb6StunEjTZIxZpF+hJoqH+04loS3+OUn7lpSSVq1hSHr56f4WA4WFAJs0ED5R6ESivA==
X-Received: by 2002:a17:906:9693:b0:7c0:e989:bf70 with SMTP id w19-20020a170906969300b007c0e989bf70mr7573593ejx.25.1671814875885;
        Fri, 23 Dec 2022 09:01:15 -0800 (PST)
Received: from blmsp ([2001:4091:a245:805c:9cf4:fdb8:bb61:5f4e])
        by smtp.gmail.com with ESMTPSA id 17-20020a170906319100b0084610118010sm1552449ejy.184.2022.12.23.09.01.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Dec 2022 09:01:15 -0800 (PST)
Date: Fri, 23 Dec 2022 18:01:14 +0100
From: Markus Schneider-Pargmann <msp@baylibre.com>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: tools <tools@linux.kernel.org>
Subject: b4 prep -n ignores b4.prep-cover-strategy
Message-ID: <20221223170114.oairw4taqptkq3ou@blmsp>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hi Konstantin,

maybe I am doing something wrong. I set the cover-strategy to
branch-description in ~/.gitconfig:
	[b4]
	        prep-cover-strategy = branch-description

Then I create a new branch using b4:
	b4 prep -n up/test -f v6.1

and it creates a commit instead of using the branch-description:
	a9fb7aa725a6 (HEAD -> b4/up-test) EDITME: cover title for up/test
	830b3c68c1fb (tag: v6.1) Linux 6.1

I verified the config variable:
	git config b4.prep-cover-strategy
		branch-description

And I am on the latest version:
	b4 version
		0.11.1

show-info shows that b4 is not picking up the cover-strategy:
	b4 prep --show-info
		branch: b4/up-test
		cover-subject: EDITME: cover title for up/test
		change-id: 20221223-up-test-d1f1526622b0
		revision: 1
		cover-strategy: commit
		base-branch: up/mtk/mt8365/power
		base-commit: 830b3c68c1fb1e9176028d02ef86f3cf76aa2476
		start-commit: a9fb7aa725a642cf72e16ff45d74a07e66c9b63e
		end-commit: a9fb7aa725a642cf72e16ff45d74a07e66c9b63e

Thanks,
Markus
