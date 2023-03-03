Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2607C8F42
	for <tools@linux.kernel.org>; Fri,  3 Mar 2023 19:02:39 +0000 (UTC)
Received: by mail-qt1-f175.google.com with SMTP id c19so3943418qtn.13
        for <tools@linux.kernel.org>; Fri, 03 Mar 2023 11:02:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1677870158;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HFJivUul6SKcXeuQepOhLm52Dt+paD1meSexirLGYcA=;
        b=XYAFRLhlAx4B4Vdv5U/sJIB2wtsUaq+JzuAOcuTEJBsteSwGJ/BUJFscuZ2b1YlDF6
         LhjrGqCnMOs1LZuUXO7r8/I+YNsi4JGgIIuiank1qhUBcEOM7rc7d4M38GH4kMqsU/CX
         uuYAKPP3sqiKhD5veNuze9OD2bptii96vtZU4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677870158;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HFJivUul6SKcXeuQepOhLm52Dt+paD1meSexirLGYcA=;
        b=uDrpx7AlHF1MZoiV/op1p8DtUzSZ0hSF5VS94td4/KcM6EXHjxPIXMs6f7JZF1vxQ+
         x4tFxaciJdg4yzl4OS469P8OVgI6IsVt3GVRszj9lkyUrL1ElKUojuwUgkZKwgi8Gkyx
         9Rs4Vm5O7xbNunDk7wjEOVgMr+7+0ihssNrDC+71YkvAomJI+OGWDebRvganB1/UGkR/
         Ksbihde9l2ROlQfYFqrRPYksrqd2sp2LpT98qkEf+s0mwbG2U5AspTLgKFJtYDnAvcce
         PlFDF1x8mSjYbUMlKOGgP7QJCmIaOCmNA6NdeAaaM5NdF2qFp2KtEJ2OZDyi+6Ye0SHe
         u2GA==
X-Gm-Message-State: AO0yUKUr11lWDJw3MOvnvF5aziddq4sHWM2gN4SjN4RQVTUJ+AyfyaxN
	EDyhuY/ZdqLJfuAuF7NXIF5AA9TGuEF4HRXv
X-Google-Smtp-Source: AK7set9ofOZiehv2MPaOySadTbulIYw0MU8XvpUTDN34JJxj5nRcw2wt0t3ddkH7LC7VpeYrrya33w==
X-Received: by 2002:a05:622a:4d1:b0:3b8:5bc6:deab with SMTP id q17-20020a05622a04d100b003b85bc6deabmr4556774qtx.8.1677870157833;
        Fri, 03 Mar 2023 11:02:37 -0800 (PST)
Received: from nitro.local (bras-base-mtrlpq5031w-grc-30-209-226-106-7.dsl.bell.ca. [209.226.106.7])
        by smtp.gmail.com with ESMTPSA id j14-20020ac806ce000000b003bfb5fd72a7sm2183527qth.86.2023.03.03.11.02.37
        for <tools@linux.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Mar 2023 11:02:37 -0800 (PST)
Date: Fri, 3 Mar 2023 14:02:35 -0500
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: tools@linux.kernel.org
Subject: b4 prep --cleanup
Message-ID: <20230303190235.4tlt2btxhnwdfugy@nitro.local>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hi, all:

A new feature just landed in b4, which will be useful to people who are
sending a lot of series. The command will archive and delete the branch itself
and all related tags that are tracking the previously sent revisions.

    b4 prep --cleanup 

This will list all b4-managed branches. Pick the branch you want to clean up:

    b4 prep --cleanup b4/feature-that-got-merged

This will do the following:

1. find and display all sent/* tags associated with this branch
2. confirm that you want it deleted
3. create a tarball containing the cover letter, tracking info, and mbx files
   with patches for the latest series, as well as for all previously sent
   revisions
4. save the tarball in your ~/.local/share/b4/prep-archived/[change-id].tar.gz
5. delete the branch and tags from the local repo

At some point in the future I may also add ability to unarchive the patches
form the tarball created by this operation.

Regards,
-K
