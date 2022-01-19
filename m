Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2C432CA3
	for <tools@linux.kernel.org>; Wed, 19 Jan 2022 13:31:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1642599100;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=GoQzt9RabsU9pWmNFSfu2keveBTV7hcfboWNCXWZm5E=;
	b=bvdWgagD0MDU6xp+BtghGg2eO4ovoW4JvI1hFbRI5BRQCh4Aq9CMYXiPa7wrER4THHXFeM
	19n8T9pRjUtSKe40f2RB12BgxWAb3zvCgb/dL6ATwQOPTAmswERY2MHsjKq/wZkI8lpexc
	wK4KiMbQHYW2v9R+a5HLcYNl5Ez4jHI=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-490-Gur7vQhLPKa9O1wQo-llOw-1; Wed, 19 Jan 2022 08:31:38 -0500
X-MC-Unique: Gur7vQhLPKa9O1wQo-llOw-1
Received: by mail-ed1-f69.google.com with SMTP id el8-20020a056402360800b00403bbdcef64so2327907edb.14
        for <tools@linux.kernel.org>; Wed, 19 Jan 2022 05:31:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent
         :content-language:to:from:subject:cc:content-transfer-encoding;
        bh=GoQzt9RabsU9pWmNFSfu2keveBTV7hcfboWNCXWZm5E=;
        b=h8TGJGPDENB3lwSMe0XoO2u62tPgVb9xtkFIuc+HfapBKy9zBEQ8+Ol9gLcxie2Wyf
         d6N5FfpSS0UUxjPYo6uNADiI+Rvdj42Ku0Q1Zuv3Lozs+B72d2w2GBjRVViGVgQA5u2e
         07fHr+cAmHTcW8RYeg0tg6+cEasJohh4nw8XhUkWkm/v0J+nVbwtUcw9yF33ei5mJvtJ
         EhAemSuMHadzuVs0Ksr1cwLxvxxmXACqeB2iDrEq3AsGgM2y8/DzM5ZmyMJ8P3Ndzg+y
         HOhoOPyd3sb+T6E4yatvgqldZGk1V+h6JgWovxg0osW3AfhVwD+MDjcZmwQSEM/A7PFZ
         f1bg==
X-Gm-Message-State: AOAM531fMeYlH2fGaxOfewtdeeMERx/SvudccOA5iuou9TpZkJvZc5R9
	nBqVysP0cUXR1ecbf3JAMWoWOcpOj7qTHxIY65J+MgV9BowjlvYWNVPSV1r/T4doE60f4YQjbdm
	3BF2pF54X1VO4KQxkj6izaMJig8gaaGWEYaHbfJ1qdKurMJOeeroBQb59FddNyg7Df+w=
X-Received: by 2002:a05:6402:4c5:: with SMTP id n5mr30715561edw.122.1642599097176;
        Wed, 19 Jan 2022 05:31:37 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy0CccpVImGpgPGaTKpND/4LDjIeZePjT9/JBDSe5XE6mb26rly44l4qzRqBMc6bFRQIxlWuw==
X-Received: by 2002:a05:6402:4c5:: with SMTP id n5mr30715542edw.122.1642599096973;
        Wed, 19 Jan 2022 05:31:36 -0800 (PST)
Received: from [10.0.0.110] ([93.185.13.26])
        by smtp.gmail.com with ESMTPSA id r2sm6384152eje.60.2022.01.19.05.31.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Jan 2022 05:31:36 -0800 (PST)
Message-ID: <91cde2a6-f71f-1e76-8bd7-3a3a0fcc6bd0@redhat.com>
Date: Wed, 19 Jan 2022 14:31:33 +0100
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
To: tools@linux.kernel.org
From: =?UTF-8?Q?Lum=c3=adr_Balhar?= <lbalhar@redhat.com>
Subject: which version of dnspython b4 really needs?
Cc: Michel Alexandre Salim <michel@michel-slm.name>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lbalhar@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hello.

I'm preparing an update of dnspython for Fedora to version 2.2.0. One of 
the packages that fails to build with the new version is b4. I'm kinda 
confused about the version of dnspython b4 needs.

In setup.py, b4 has 'dnspython~=2.0' which includes version 2.2 but 
requirements.txt contains 'dnspython~=2.1.0' which does not include 
version 2.2.

Which of these two definitions are correct?

Thank you and have a nice day.

Lumír

