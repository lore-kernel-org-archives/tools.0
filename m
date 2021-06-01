Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com [209.85.210.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AA1571;
	Tue,  1 Jun 2021 23:42:34 +0000 (UTC)
Received: by mail-ot1-f50.google.com with SMTP id 69-20020a9d0a4b0000b02902ed42f141e1so923968otg.2;
        Tue, 01 Jun 2021 16:42:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=hDVIKYBLeyhF1xY++hynpDXSMBo9yz4Vk6COjH2Jonc=;
        b=jRy2pTgnoqtwUlIXe3+oY6gnAGcCpbzJPPnRBz8vHim1HZadHPvpZqqdsbi20gAm/D
         zswQB+dBShvlgzDe/9pr0U9RXrufp4qlhBI9au9LJqVTyLCeOYCkjC/BJiW0Bm2iEtJw
         UBVZ2yhXPwl1IoMlMvU5mkVrBaVKv82ylrQTw9gIYUXm3hAo7K7dV4swSY/jnOmEmHlD
         OFGg4O6xsKQTwaOIJGd4AqIsnIqjOyU74gF6DRU9et6JbXTgMRElfwE7enZGPks9ZrRd
         NUyR01TrUD2QFQDMK8jhLC+tjyPFPcMguS7pUXUcYfExw1o3ryThL0L7BRgoe3Cv3ANn
         Nhwg==
X-Gm-Message-State: AOAM531s9Mspl1F2GLTWcBM3rYLj40b+aYyWxBRxVYNRhCCPtKhmeN0b
	NLRPzFHRweMKdEVz2HeBzGhO+CRJqQ==
X-Google-Smtp-Source: ABdhPJy2Qk3vOVKQQE/R/8cxBNxMV5zptHo8a1JZ1mtF+YT/5MedJsWD5ZZRZGk9PPO7O4V9SQbh+w==
X-Received: by 2002:a05:6830:14c5:: with SMTP id t5mr24078798otq.266.1622590953333;
        Tue, 01 Jun 2021 16:42:33 -0700 (PDT)
Received: from xps15.herring.priv (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.googlemail.com with ESMTPSA id w13sm4046960otp.10.2021.06.01.16.42.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jun 2021 16:42:32 -0700 (PDT)
From: Rob Herring <robh@kernel.org>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: tools@linux.kernel.org,
	users@linux.kernel.org
Subject: [PATCH] WIP: pw-review: Skip already acked messages
Date: Tue,  1 Jun 2021 18:42:31 -0500
Message-Id: <20210601234231.1345022-1-robh@kernel.org>
X-Mailer: git-send-email 2.27.0
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Rob Herring <robh@kernel.org>
---
 pw-review | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/pw-review b/pw-review
index b0f4173810a7..0105c2af17ce 100755
--- a/pw-review
+++ b/pw-review
@@ -73,6 +73,11 @@ open_mail_msg() {
 	local msgid="$(sed -e 's/<\(.*\)>/\1/' <<< $1)"
 	b4 mbox -p ${LORE_MAILLIST} -o "${LORE_MBOX_PATH}" "$msgid" 2> /dev/null
 
+	if mboxgrep -m mbox -H -i -G "message-id:\s*<$msgid>" "${LORE_MBOX_PATH}/${msgid}.mbx" | grep -q -E "^(Acked|Reviewed)-by: Rob Herring" - 2> /dev/null ; then
+		echo "Already Acked..."
+		return
+	fi
+
 	# mutt doesn't handle these correctly
 	sed -i -e '/^To:\sunlisted-recipients.*/d' "${LORE_MBOX_PATH}/${msgid}.mbx"
 
-- 
2.27.0

