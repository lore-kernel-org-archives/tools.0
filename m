Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A2251868
	for <tools@linux.kernel.org>; Sat, 15 Apr 2023 19:31:19 +0000 (UTC)
Received: by mail-qt1-f169.google.com with SMTP id gb12so19502336qtb.6
        for <tools@linux.kernel.org>; Sat, 15 Apr 2023 12:31:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681587079; x=1684179079;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JYMA0JeW+nXbGOhhi55aru/HPxQzM9I7furzZ6IwwXs=;
        b=FVyzs5CwZJL4sr8n61gPZpyPR1TT7mjUyhsEmjxvtoRDSbQ6UAWH0vCL6EKmwSBRNy
         Vk46n777VZg3KO/PVXQHLM9/2XkwVddpwaqTxbefvO9krjUAjtje+lbrgJnnM/xzweeU
         Hshn3AzvXWm9ELLn/GRN5S5W6IQ5EEK4nJ11ZP0uFTxMymd/38LRBO2LsPaJ/pN24JQL
         AaAeHsR/lrVN6rOeRP8Ue85V5f+OkUoP8yni1O+ZxtvxkvjqsDDXgN6eNvwbAwtuvUOo
         TStOMX1iObUuPL9a+MUvOkG+gGHKHo5Zx1O+Qu4badrg8UBB3Z3iPRGSd2MxgQsfgVab
         GiwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681587079; x=1684179079;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JYMA0JeW+nXbGOhhi55aru/HPxQzM9I7furzZ6IwwXs=;
        b=B6k3h46qOlB8SDCD2NwJQMG328CTXmU0Q4B36xa3MkQf9zp1moUuW7c/CZEsp4rs1S
         3aDdU5PT0bCBjXcMLk3Z0jw8RFSQS5Ec+fNEY7WGsDYPmwMY1kzHu5vI7pJyxI4SEPZC
         598l8hK1yaEGLs5SRbMgd+QTY4KJDQR98jJa2ScZBVurQNOolNIXYqZh1xrxYBoXLPMR
         r4w4+bD2PCkgsb8fe7eXV4I5bpJSeNt5DDem8F3Y9rNtXnW/paI0Qb1lCz32GQWfx9yr
         5kVKdSheSsKtsmkQsu18BqGJwgBTpMoX3G/NVfrTgt01BwLAmVfjziez9dSHC8AqSuxQ
         9MAQ==
X-Gm-Message-State: AAQBX9f2tA2AXLVKUw1DUxsTDEe/9Adc6aOCOw8VHQTWG/OwGEZFRhmq
	+GK6mY1TcxRtYhpO8ZaBBuXLLf3C70c=
X-Google-Smtp-Source: AKy350bHogbjE8PN1TNymUdEE1rETJ+vQBBHtjAsTKYVlBYqIoSEk81qtqZv8XDrt2zbvvOBq8DbNQ==
X-Received: by 2002:a05:622a:d3:b0:3e2:e280:c4a1 with SMTP id p19-20020a05622a00d300b003e2e280c4a1mr14614419qtw.52.1681587078879;
        Sat, 15 Apr 2023 12:31:18 -0700 (PDT)
Received: from [127.0.0.1] (173-246-5-136.qc.cable.ebox.net. [173.246.5.136])
        by smtp.gmail.com with ESMTPSA id f21-20020ac859d5000000b003e38f7e4562sm2086707qtf.69.2023.04.15.12.31.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Apr 2023 12:31:18 -0700 (PDT)
From: Philippe Blain <levraiphilippeblain@gmail.com>
Subject: [PATCH b4 0/2] am, shazam: allow cherry-picking an out-of-series
 patch
Date: Sat, 15 Apr 2023 15:30:58 -0400
Message-Id: <20230415-am-cherry-pick-suggestion-v1-0-8951a2274256@gmail.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHL7OmQC/x2NSw7CMAwFr1J5jUVbQj9cBbFwg0kjlBDZKQJVv
 Tspy5HezFtBWTwrXKoVhN9e/SsWaA4V2JmiY/T3wtDW7ak2zRkpoJ1Z5IvJ2yfq4hxrLhYOHY2
 j6fuBOgvFn0gZJ6Fo572wJM3CFI6BNLPsiyT88J//+xUmA7dt+wEMW0pBkQAAAA==
To: "Kernel.org Tools" <tools@linux.kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 Philippe Blain <levraiphilippeblain@gmail.com>
X-Mailer: b4 0.13-dev-c01b1

This series makes am and shazam able to cherry-pick a patch sent by a reviewer
as a suggestion (second patch). The first patch is a preparatory
simplification.

If you want to test it, you can do so in a clone of git.git:

    git clone https://github.com/gitgitgadget/git -b pr-1515/phil-blain/doc-auto-merge-v1
    git checkout 66c7e51415
    b4 am -o- -P_ https://lore.kernel.org/git/ZDnCMegeiw0kT5oj@nand.local/

Cheers,

Philippe.

Signed-off-by: Philippe Blain <levraiphilippeblain@gmail.com>
---
Philippe Blain (2):
      mbox.py::make_am: simplify check for early return
      am, shazam: allow cherry-picking an out-of-series patch

 b4/mbox.py | 17 ++++++++++++-----
 1 file changed, 12 insertions(+), 5 deletions(-)
---
base-commit: 00303592f25693cb4eddf58fb51063afcff8dceb
change-id: 20230415-am-cherry-pick-suggestion-86a994778a6c

