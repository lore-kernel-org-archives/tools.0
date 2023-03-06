Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 998EB5688
	for <tools@linux.kernel.org>; Mon,  6 Mar 2023 18:02:38 +0000 (UTC)
Received: by mail-qt1-f171.google.com with SMTP id l13so11545478qtv.3
        for <tools@linux.kernel.org>; Mon, 06 Mar 2023 10:02:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678125757;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7HQNg8EQrFWtBtioJevpMEGmMhPCRFMSwx/o3zTZP48=;
        b=gOpwy5xIVVI0Q3UH8b87nAdIW9OXE2DrEuwaoYa5mrQRbqr4nGds9DWWyXua+oIQ4U
         qZfZ2/eQjV/AQcFtbUJ26gnr2pH5pI041S5pAnfv2UZUMZEYZplWdNGyCHuISNO1o0eb
         4cnL/hWDcgjif8QwBA8paUiG/V7lfyrUnADc5QOXnYuHe47BHtbv/pW396KRMRE859d8
         w/vFyBzT4v3hfens75siy+g80U5IHwW3ksvhiY+Ai5JDIa1JsgFrJm+pmUkIUbE3jHHf
         ia4zU1PWEicZGG5eP4fIglEe/KBkRr7JUnG5LsICAeLdxLXiGFy0Nw7ayCHks6Jd+Obi
         S16A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678125757;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7HQNg8EQrFWtBtioJevpMEGmMhPCRFMSwx/o3zTZP48=;
        b=MjWwXzm0i2uB148ZQbtZpn/60upYFEKF45JORvK1y1TJALzGlcL0A4GhzQfqgvU97W
         sFmG1jlsv5NszRSVzjoGklh5znDHEowx9R+4Y1dec3aZ+Hy3FCnF3TPtk5fHjGJ4kwcd
         tSA4Hoa0OZU8l/vLtEJ/DGIZfuuVgYtSBll0zUjWcUAsOKm5VU/gj/5hs8ZQFE9O1mQy
         eNaKB+zNWdNf5XQQ9aJCeeFOT2p0t0D5J0VP2NM8ywhdsG/yAiZG1a1pGdgZ44RJfKZK
         g5XzJ8TV1nxJXrS8h5zIqPvT8Gr0jy0JEWL5p0KSXKu6fRTXKUn6Z8LYhKCstusBsypM
         jyoA==
X-Gm-Message-State: AO0yUKUtdFuX4ZDONA6q7hFuQgtImYXPlD85Aof80DWScruiltsCA1UG
	T8lXMLs1cRgsoyqGMS0/+Jk=
X-Google-Smtp-Source: AK7set9ifmjRj80i+BsIOvufXJOjjmdvc7AwxazJzWACi10GTejP/tPVNY9ZDWOdnKo26WR6gXL2ng==
X-Received: by 2002:ac8:7d84:0:b0:3b9:fb0e:adba with SMTP id c4-20020ac87d84000000b003b9fb0eadbamr19722097qtd.25.1678125757466;
        Mon, 06 Mar 2023 10:02:37 -0800 (PST)
Received: from WQUEN758573.ncr.int.ec.gc.ca (ecodor132.cmc.ec.gc.ca. [205.211.133.132])
        by smtp.gmail.com with ESMTPSA id d24-20020ac800d8000000b003bfaf01af24sm8050763qtg.46.2023.03.06.10.02.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Mar 2023 10:02:37 -0800 (PST)
From: Philippe Blain <levraiphilippeblain@gmail.com>
Date: Mon, 06 Mar 2023 13:02:09 -0500
Subject: [PATCH v2 1/4] ez: allow remote-tracking branches as ENROLL_BASE
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230219-allow-remote-branches-as-base-v2-1-8db83bda1403@gmail.com>
References: <20230219-allow-remote-branches-as-base-v2-0-8db83bda1403@gmail.com>
In-Reply-To: <20230219-allow-remote-branches-as-base-v2-0-8db83bda1403@gmail.com>
To: "Kernel.org Tools" <tools@linux.kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 Philippe Blain <levraiphilippeblain@gmail.com>
X-Mailer: b4 0.13-dev-10ee4

Since 83b185a (ez: support enrolling branches using tags, 2022-08-16),
we use 'git show-ref --heads' to check if the argument given to
'--enroll-base' is a branch, so that the alternate code path can be
taken for tags. This means that since that commit, using a
remote-tracking branch as argument to '--enroll-base' does not work
well, because such branches are not shown by 'git show-ref --heads'. The
code path for tags is taken instead, and this usually leads to a
"Multiple branches contain object" error (since several local branches
are often based on the same remote-tracking branch).

Pass a fully-qualified ref 'refs/heads/<enroll_base>' as pattern to 'git
show-ref', and also pass it a second second pattern
'refs/remotes/<enroll_base>' to allow both local and remote-tracking
branches.

Signed-off-by: Philippe Blain <levraiphilippeblain@gmail.com>
---
 b4/ez.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/b4/ez.py b/b4/ez.py
index daa1b4f..c3b0237 100644
--- a/b4/ez.py
+++ b/b4/ez.py
@@ -371,7 +371,7 @@ def start_new_series(cmdargs: argparse.Namespace) -> None:
         slug = re.sub(r'\W+', '-', branchname).strip('-').lower()
         enroll_base = cmdargs.enroll_base
         # Is it a branch?
-        gitargs = ['show-ref', '--heads', enroll_base]
+        gitargs = ['show-ref', f'refs/heads/{enroll_base}', f'refs/remotes/{enroll_base}']
         lines = b4.git_get_command_lines(None, gitargs)
         if lines:
             try:

-- 
2.34.1

