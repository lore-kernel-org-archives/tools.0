Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F2C88C15
	for <tools@linux.kernel.org>; Tue, 31 Jan 2023 16:06:55 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id k8-20020a05600c1c8800b003dc57ea0dfeso4846174wms.0
        for <tools@linux.kernel.org>; Tue, 31 Jan 2023 08:06:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tessares.net; s=google;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K1g7x/C/1Pm4NcPPpziqNhSU4WL3QKlJvWVcH0oqpak=;
        b=1po0GKDnL7/VBgn8eUYCmu8Rl6ZiipEj+BVboUCRQBbrGHB91fplXIJV+bb4H/pJVf
         VkezLHyIBLYrmax/8sAtpO6DtbnlDuQ26ZGBpSK+OzAU4FPFTfd4PHG4KOYYo0YBuUrM
         A2ulhQQJkMFLQhd7Kojss1+J8fKoFy6vIlTsMKHn5ew7l3isPfcF/osMfmLo0SDpy3Sv
         co3wYVAYNN8fzL5usk4VD2yXRa2rU1Ydadbe28ohDKo/jxbwRQWULIoyk3ZOaf1500xK
         kTJOn0FdYv4BQFAF/41Xg9Fn0fQa6piK7o6ZqWEUheaCswY4NmkM94qSXC7OFemqrw7+
         2sSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=K1g7x/C/1Pm4NcPPpziqNhSU4WL3QKlJvWVcH0oqpak=;
        b=oMPnXrP0uukvcOG+zLBeT20m3Tsj9PtF0XjVmFulnJ67xdDaxx6x0qAHjXw7EDA2Lw
         ss9I55rbFrl+6Q32iqRnpD1AUaemRMYhMkn3rROcJXPdYlya/SFhW/ERJ3npTd5Hbnl1
         rI58eh4qU6Lo5GXs5xTwENYip180CJywu/ssm2kz06KJZ6YdxuBKIN1gBWbwR6epL+0/
         CgIXfx4TlZ5zVZWfK1iBig3E4euFLwFyvZLtQztEeH+GskCtfzlQ/pwfOvPq9InQ092J
         Y1mJprVy+XV+nf59J4rykLT+Z2kQWok93SaKp9N4LXXEo+iNhmEWVA+6RwCRdF7oEZ+K
         XXJg==
X-Gm-Message-State: AO0yUKXmkM65znOr3+gFT7emQ+rK8KuPe21Dn+UVVmDMEXcTx4a/0Bsh
	aGcnPziHBGv6e5E9RU4LU9jrFzDjjPL9maIvZi7Cbg==
X-Google-Smtp-Source: AK7set8FT7CnR1dYEDwQK6oJI0zYY9UxNlueZ9i6RvsKJn598g7kdmzbDYZOzXmVhNTqz7L/SIJBaQ==
X-Received: by 2002:a7b:ca53:0:b0:3d9:ee01:60a4 with SMTP id m19-20020a7bca53000000b003d9ee0160a4mr86248wml.1.1675181213369;
        Tue, 31 Jan 2023 08:06:53 -0800 (PST)
Received: from ?IPV6:2a02:578:8593:1200:3c4:638a:a912:cba5? ([2a02:578:8593:1200:3c4:638a:a912:cba5])
        by smtp.gmail.com with ESMTPSA id ip7-20020a05600ca68700b003dc433bb5e1sm12617559wmb.9.2023.01.31.08.06.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 Jan 2023 08:06:52 -0800 (PST)
Message-ID: <233f0440-7f20-6edf-256c-b8ebec53539e@tessares.net>
Date: Tue, 31 Jan 2023 17:06:51 +0100
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Content-Language: en-GB
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: Tools <tools@linux.kernel.org>
From: Matthieu Baerts <matthieu.baerts@tessares.net>
Subject: b4: idea: checkpatch.pl integration / hook support
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Konstantin,

First, thank you for developing and maintaining this great tool!

B4 works very well to send patches. But there are quite a few steps and
I think it is easy to forget one :)

For some like "b4 prep --auto-to-cc", that's probably OK to miss this
command because "b4 send" will mention that these patches will only be
sent to the author + other emails found in the patches. (It might be
interesting to have a more visible warning / confirmation if no
addresses are found in the cover-letter but that's not my main point here.)

But for 'checkpatch.pl' or other scripts specific to some subsystems,
there will be no reminders from "b4 send" to check that.


Do you think it could be possible to integrate such tool to b4 if available?

For the moment, I do this before a "b4 send":

  ./scripts/checkpatch.pl --strict --codespell \
   --git $(b4 prep --show-info | awk '/^start-commit: / { print $2 }')..

(checkpatch doesn't seem to support empty patches, we have to skip it)

What do you think about having a list of hooks that can be added in
b4-config file?

For occasional contributors, it could be nice if it is automatically
executed before sending a patch. But I understand there might be other
issues to deal with: missing dependences, false positives, different
rules per subsystem, etc. A mention in the doc and/or before sending the
patches might be enough.

Cheers,
Matt
-- 
Tessares | Belgium | Hybrid Access Solutions
www.tessares.net
