Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D15A2C82
	for <tools@linux.kernel.org>; Thu,  2 Dec 2021 23:38:38 +0000 (UTC)
Received: by mail-pl1-f178.google.com with SMTP id n8so850863plf.4
        for <tools@linux.kernel.org>; Thu, 02 Dec 2021 15:38:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=mt8/VFrTpqWz2he9wXvGKgslxpD7wQ3TkMixAkjOf40=;
        b=E/M/HBKcHrxCJJ8UqAe287GidOvhh0GYF4Qu6OJgvM5lN+5NhNErZ8Y5nLBdbFDwbN
         r5rWItnf/5R3XbGxEGcZ5t15F8AE0H1Qfj8mj0Fwaqy8+HaYw7p6YY2VqtCJXhoXOs9h
         PIPXmqe18ZRvI6ytL97445xZ8C7d+ANm8cFb8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=mt8/VFrTpqWz2he9wXvGKgslxpD7wQ3TkMixAkjOf40=;
        b=VAhxQ9NBAl8Ndj8RCDi4rsF1OEFMsdITPYzDvo6waWYviu0gIWxuJPvFMUbh921x2q
         Apo/top/slnarnXXViidAP1AItevLmylgKJQ3MGqIV20zB8Mtf7r7h1iJkuh5hb/+iat
         AfoZ5donkydbwkb2bSs0efGRta1FLylfZjOAImiYE3e4xFf3hhwi3qttWiRdJEZWcFU2
         Jvb28CBfsYuf2Y7WcgamYqfd7WSELeiz0rAqaQoJRy9pMEwX+ZxERgN8AKub8A29V47f
         bg0xqUHBIZFhMPvg5mVsUkS00FW56ubQ9h8gshGEYWw7DDF4sucgResmZFZYB95l3nE4
         3g1Q==
X-Gm-Message-State: AOAM532twYL15TK0VPFdhxVN2IwbVytR720NKzt2NLancXC8e9CY/Y9g
	fWprbkZyhCAvxD6RweO+z6GLK0OTUsoTtw==
X-Google-Smtp-Source: ABdhPJyQq+QoDHAg6Ra0R0SYxtWeWKZf6olVX8iP6kDq7g0qtIcRo6NOzHspn/edRtiJeHT1p9P+mg==
X-Received: by 2002:a17:902:9888:b0:142:8731:4b55 with SMTP id s8-20020a170902988800b0014287314b55mr18679638plp.51.1638488318562;
        Thu, 02 Dec 2021 15:38:38 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id d1sm866397pfv.194.2021.12.02.15.38.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Dec 2021 15:38:38 -0800 (PST)
From: Kees Cook <keescook@chromium.org>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: Kees Cook <keescook@chromium.org>,
	tools@linux.kernel.org
Subject: [PATCH 0/2] patchwork-bot: Ignore empty context lines
Date: Thu,  2 Dec 2021 15:38:34 -0800
Message-Id: <20211202233836.2024510-1-keescook@chromium.org>
X-Mailer: git-send-email 2.30.2
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=467; h=from:subject; bh=yaLYDVYTUWm3bln0T6HmGHjbJkKwxPSdQS7lhZP+4Uo=; b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBhqVj7BFp9XgCjLxB2eZBFsJj+FmTKtLa3rkRg1WWU 1LA1jFqJAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCYalY+wAKCRCJcvTf3G3AJtfnD/ 9MQbaPpSI2+F7JVzDoi4KeFJdVTF77uH3Y5ukOVz/9K5wO+NiBurecxyV81XTD5ZF35rU9/TDACouo ocnDGVvxtM3uNfFfG7Z6hZVZIZOJe/VimaeTj08PoJ5Nox3HQ0PpqPkxkO1Ts49mEs1UYKyg88MYnk 6c7A1qW/WCPmpfRQ8I/cW8Ao2N0hSJ69vIjG8K4CKPzLm8TIxX5JUdPb4V5KZrQN8M1rHrkLkzPEE+ 1Wxwc1CAfYSdpAlf+OTeWpip83Wp68wfpVCGIuLaS/bHdb9IqcsSwy/iWygFoYIr1cYSQ1m+NzPr8c VWbh4L5SJ98qgNvOp+5eOohmU3Gmd9TW/m0xDWv2SnBpk3CixKT8X6i3DRUoUbk6F06gTyRwQxBDw+ Ib6AZfMRhcC5GbxZ0+Z72+5c9JMtZP6wp4NtQya7HmjWNVNP/dgxdGLV8xGPXltxauh7ib0GBvLujL ciNIqOinm+jG622nuLWqwZEZ/kVI3p4hy/XaJuJz8B3J7kxVlgnPVUOt4d0aKiRuwFhd8lQ/Z9IZgK e6eCTQWNzfUhsgLgMQ8AhuDrjAT4lljJjNeXtpukU0FlzCZDUrwZ3yszhqKPVAh7+LMtKWpzLvvF7G UIi5cK/QH2Ks7e7cx91Rd/KjHZWuLRhBRzVRoCXuPVcsmpw2OQ+IBTs1fdJw==
X-Developer-Key: i=keescook@chromium.org; a=openpgp; fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
Content-Transfer-Encoding: 8bit

Hi,

I had several patches that seemed to be eluding the automatic state
changing even though they appeared in mainline. This appears to have
been caused by a mismatch in whitespace interpretation between git
and patchwork.

-Kees

Kees Cook (2):
  patchwork-bot: Ignore empty context lines
  patchwork-bot: Add --pwhash for debugging

 git-patchwork-bot.py | 24 +++++++++++++++++++++++-
 1 file changed, 23 insertions(+), 1 deletion(-)

-- 
2.30.2

