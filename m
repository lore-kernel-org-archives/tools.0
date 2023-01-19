Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF0673D6E
	for <tools@linux.kernel.org>; Thu, 19 Jan 2023 21:32:28 +0000 (UTC)
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-4d59d518505so46791067b3.1
        for <tools@linux.kernel.org>; Thu, 19 Jan 2023 13:32:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=t7Xr9Yh79bobFkHOEde/aIgosLWC05vAwdacC9Bh63Y=;
        b=Tx4iiMqtLi2CdJAODb4JeKica64tL8RxV8VsPukpnUQLPhi9Ccpkn45m8d8XI5HbCC
         OCQHkyVPL52J+NYT/FtBa3xdJZPTwzOAzAIvtCdENNOH/jTL6FHbRXSSOaRSVWqy/oLd
         osOhWldfaLtpYe0b0QLS1eiehtwdqqHWxC9UQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=t7Xr9Yh79bobFkHOEde/aIgosLWC05vAwdacC9Bh63Y=;
        b=D0ewWhL85KeU7TEuKf7G5y5h2m+AuOWpsGh4cKWx4+l5d1ZNR4VTo6Xu5Rc9k/aL5N
         AihfdRRsWnL8npXP8k93jiYfy8PaD3gSJqrc7dGhGSjWFC+/aXr2fCzxxq0syltom4sP
         x2qgMxKnoXeWll9xahe/8nUDGpvj1ZoQDJMaeGp6hCdq8ldMcyibIFhTgho4mDyfxpjX
         W699Yrm0t9UJTnIu7cHVJiil2J2CwuVD+gXunylvmWw5oWiKhCJnurzibsKYTojamaWt
         rchT+azdM71sbBBbwF2fe3MDLRnfGYBXNky/OODyTC7ig2PU0pxxwJkzPYw0zcJ6Z2ZR
         E3Qg==
X-Gm-Message-State: AFqh2kpGkKU7v3JVP+qa89PWoWWeqYg8JGVBuTSFZkuCguesskkRW+f2
	2cuzqfeDRCJI4M5tAEg0bhAE1Aady3lJdGDX
X-Google-Smtp-Source: AMrXdXsrB63IHis0R+m2tEhtSE+Eo9ZMO/CZbk0tc+Jcv5c4SCyq1SA29Z4DngAmvr/qnUKbgiopnw==
X-Received: by 2002:a05:690c:308:b0:4ef:3643:a16a with SMTP id bg8-20020a05690c030800b004ef3643a16amr11499278ywb.52.1674163947433;
        Thu, 19 Jan 2023 13:32:27 -0800 (PST)
Received: from meerkat.local (bras-base-mtrlpq5031w-grc-30-209-226-106-7.dsl.bell.ca. [209.226.106.7])
        by smtp.gmail.com with ESMTPSA id l16-20020a37f910000000b00704df12317esm24870287qkj.24.2023.01.19.13.32.26
        for <tools@linux.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jan 2023 13:32:26 -0800 (PST)
Date: Thu, 19 Jan 2023 16:32:25 -0500
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: tools@linux.kernel.org
Subject: Upcoming 0.12 release
Message-ID: <20230119213225.ccw3dxb42l6bzsyf@meerkat.local>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hi, all:

I intend to release 0.12.0 tomorrow in order to provide a solution for the
python email module bugs that we have identified. They are actively causing
grief for the users of "b4 prep/send" and I'm worried that this will hurt
the b4 workflow adoption now that it's starting to take off.

I was hoping to add more features to 0.12, but they will have to wait. The
main feature in this change will be the switch to our own patch generation
routines.

-K
