Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4777586E2;
	Tue,  6 Sep 2022 19:17:03 +0000 (UTC)
Received: by mail-pl1-f174.google.com with SMTP id 9so9015394plj.11;
        Tue, 06 Sep 2022 12:17:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date;
        bh=lw9sCAgsOPBmOKdJSMw57R0dg81iq7BwIWuKoK48IgM=;
        b=iNDTauK/ddUMWcpjhnI6zMwVjGxlruEVHLzi8Pwf8kbEUQoZSLkJbFpvwXCZ7F+7av
         sChsHGkLUX2AIxLuvJUSkOYawwX4/VHn1WVqNzYJ3fvjxSW9epXZu71twv0wD/B+H/SI
         loIAgepFyIMaScjmcT4OjUnvlAtVk6B5HwZY5xzmdw7W9Zp5Uq3W07BYBgPORXyFhclT
         djb4DuPQMFHv4ee4cgQnm6KnpUoHpnX82m9bs2ERK7CyZ4MSyAZy2igfSTRW9zUrHAoX
         +V4tHDg7nKytD9232vWXQQB5TgGxsMyPQ0zLQFJBSQv/c/vPx/xIK35G5Y3evAd7ikQv
         lDEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date;
        bh=lw9sCAgsOPBmOKdJSMw57R0dg81iq7BwIWuKoK48IgM=;
        b=KqiU7zCKTdzgo6n3sdr3A792x4pmL3lUGmdjGHXIuWkIdSHkcQ3VV1BDiHKZVxH6G7
         70PzcEN8+UDIs06c0wl5ilMGUgJfeAY5S3vXVfMs5cV0YfYv69sk5XypG/V8dDUQ6sH1
         MB0uvfrwujg76PXgXN7O8Wl7pr16H33DGLXTkvndEtfkAQJ0vS3/Syv/ktkc3wTMuh6L
         cjAG0IgmWCEN2iWpxfuia+EMYrXEUQr/picwuCU43P9I2dWnbTGIXPQGH8azWZt86w+/
         H7vggCcCzzTA4t4pY4kjjv3YwFxh7pVw5ML/vQxB0xX7BbMq/1RJs/8dnyrlWbDyU7ub
         Sf7A==
X-Gm-Message-State: ACgBeo3/qFvijr6Ff6SrOyr+yI/v2VtL+HU19W2O4nf9fbKX4zUh61r/
	Cbek8BVhjSYHPzVbZtpExS6op5GGhqM=
X-Google-Smtp-Source: AA6agR4hnxvnLPKpyCWqOmoSi0PF/8HNUCIzSUmvI04EfwsXBWZjoMeFtEa/ROonB8+9yP598YYSfg==
X-Received: by 2002:a17:90a:6784:b0:200:36ea:fe58 with SMTP id o4-20020a17090a678400b0020036eafe58mr16063384pjj.16.1662491822512;
        Tue, 06 Sep 2022 12:17:02 -0700 (PDT)
Received: from google.com ([2620:15c:202:201:1190:fbfa:ae95:111c])
        by smtp.gmail.com with ESMTPSA id t18-20020aa79472000000b00536431c6ae0sm10607552pfq.101.2022.09.06.12.17.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Sep 2022 12:17:02 -0700 (PDT)
Date: Tue, 6 Sep 2022 12:16:59 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: users@linux.kernel.org, tools@linux.kernel.org
Subject: b4 prep/b4 send feature request
Message-ID: <Yxecq5DHE5oW0XJD@google.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Konstantin,

Not sure if you are taking feature requests, but it would be great if
the magic that happens after sending patches via "b4 send" could happen
on demand.

The reason is I am using OAuth2 when authenticating to Gmail to
send/receive mail, and b4 does not support it, so I tried using "b4 send
-o ..." followed by "git send-email ..." (and I was able to set up git
send-email to work with OAuth2 tokens), but in this case the magic does
not happen.

Thanks.

-- 
Dmitry
