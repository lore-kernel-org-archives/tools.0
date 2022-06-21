Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31BEFEC1
	for <tools@linux.kernel.org>; Tue, 21 Jun 2022 20:43:29 +0000 (UTC)
Received: by mail-qk1-f171.google.com with SMTP id v6so311738qkh.2
        for <tools@linux.kernel.org>; Tue, 21 Jun 2022 13:43:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=date:from:to:subject:message-id:mime-version:content-disposition
         :content-transfer-encoding;
        bh=sjjomEARVKHsF4sAPQATUpxRpNUtS4HvJOq5acgn+Vk=;
        b=ayepoac0Km4zqFVO2aq9KMEXuc4QUA1GMhlS+AO7reMbuwFRLtckdmi78lSrFKYAur
         dlyQEk4jtfPZzUe5tpaTDkbMp5oxQObePt6EL06z2rDly6wKwYX2q86xqM2Cf2KV4kQJ
         1QyZtsW5sLwn5eVkpHc96vUXobzS4JXgTRWQ0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:subject:message-id:mime-version
         :content-disposition:content-transfer-encoding;
        bh=sjjomEARVKHsF4sAPQATUpxRpNUtS4HvJOq5acgn+Vk=;
        b=cYlYsb1G2WHDOdNZQ9psUOIhk8eMD8dL0VltNdvNP2zYWo89Lq7MuwF5GJnwgliXdi
         PIChYurvXdSr7BlDqrbUHbXQudtL1bO3sjJJfMccGCOw7FhCu1+BTbNTYbrjUwc20lbC
         UmjEI4QShnM3Ney7TfazYwQoQ3v9oYwT60nXL5BdFkKW73NqW5B0X+nFKj1A0Ij4f+H2
         0uHVnxc0f8WH49qn/vShvWT6mKm6IGE70yaMmW0JgUIdBRBv3Onqev5pm2k7ako2EO9N
         Bkj3+MJVw36iWfyURUbmuli5Ab16y7Kg4yjMk3BD6yBDj8zeu3Jic9SQ6K+weKVXNscd
         5e1Q==
X-Gm-Message-State: AJIora8SM20yRC8vbzSdFEbP0qqqkO9wPilmFfwaSc1zUiO/y6A9Sa6w
	N7IdDs0DQvC8tEkWjIOue8gL4o5rwBljTw==
X-Google-Smtp-Source: AGRyM1soCCtmTf2NZG83GYxZjte9//UF1a+NHF+9ILQvmqH/Nnl6+dixAnT/Ea4kWzJ97+ZGgQsDOA==
X-Received: by 2002:a05:620a:4248:b0:6a8:3259:6a76 with SMTP id w8-20020a05620a424800b006a832596a76mr21878379qko.175.1655844207636;
        Tue, 21 Jun 2022 13:43:27 -0700 (PDT)
Received: from meerkat.local (bras-base-mtrlpq5031w-grc-30-209-226-106-245.dsl.bell.ca. [209.226.106.245])
        by smtp.gmail.com with ESMTPSA id g10-20020a05620a40ca00b006a6bb044740sm15720914qko.66.2022.06.21.13.43.27
        for <tools@linux.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jun 2022 13:43:27 -0700 (PDT)
Date: Tue, 21 Jun 2022 16:43:25 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: tools@linux.kernel.org
Subject: b4: initial patchwork integration support
Message-ID: <20220621204325.6npz7euargqk3atp@meerkat.local>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

Hello, all:

I know some of you use patchwork alongside b4, so if you're already a heavy
"b4 ty" user, you can also have it set patchwork state of those patches.

What you will need:

1. latest b4 master branch
2. a patchwork project (obviously)
3. a patchwork API token (obtained from your profile page)

To enable the integration, add the following config in the relevant repo:

    [b4]
      pw-key = your_api_token_here
      pw-url = https://patchwork.kernel.org
      pw-project = your-project (e.g. linux-usb)
      pw-review-state = under-review
      pw-accept-state = accepted
      pw-discard-state = deferred

Explanation of states:

pw-review-state: will be applied to patches when you retrieve them with
am/shazam/pr subcommands. E.g.:

    $ b4 am -o/tmp https://patchwork.kernel.org/project/linux-usb/patch/20220613095957.1669829-1-xji@analogixsemi.com/
    Grabbing thread from lore.kernel.org/all/20220613095957.1669829-1-xji%40analogixsemi.com/t.mbox.gz
    Analyzing 5 messages in the thread
    Checking attestation on all messages, may take a moment...
    ---
      ✓ [PATCH v10 1/3] usb: typec: tcpci: move tcpci.h to include/linux/usb/
        + Reviewed-by: Guenter Roeck <linux@roeck-us.net> (✓ DKIM/gmail.com)
      ✓ [PATCH v10 2/3] dt-bindings: usb: Add analogix anx7411 PD binding
      ✓ [PATCH v10 3/3] usb: typec: anx7411: Add Analogix PD ANX7411 support
      ---
      ✓ Signed: DKIM/analogixsemi.onmicrosoft.com (From: xji@analogixsemi.com)
    ---
    Total patches: 3
    ---
     Link: https://lore.kernel.org/r/20220613095957.1669829-1-xji@analogixsemi.com
     Base: applies clean to current tree
           git checkout -b v10_20220613_xji_analogixsemi_com HEAD
           git am /tmp/v10_20220613_xji_usb_typec_tcpci_move_tcpci_h_to_include_linux_usb.mbx
    ---
    Patchwork: setting state on patchwork.kernel.org/linux-usb
     -> under-review : [v10,1/3] usb: typec: tcpci: move tcpci.h to include/linux/usb/
     -> under-review : [v10,2/3] dt-bindings: usb: Add analogix anx7411 PD binding
     -> under-review : [v10,3/3] usb: typec: anx7411: Add Analogix PD ANX7411 support

pw-accept-state: will be applied when you run "b4 ty" (with -t or -a). E.g.:

    $ b4 ty -a
    Auto-thankanating commits in usb-next
    Found 3 of your commits since 1.week
    Calculating patch hashes, may take a moment...
      Located: [PATCH v10 1/3] usb: typec: tcpci: move tcpci.h to include/linux/usb/
    ---
    Generating 1 thank-you letters
      Writing: ./xji_analogixsemi_com_patch_v10_1_3_usb_typec_tcpci_move_tcpci_h_to_include_linux_usb_.thanks
    ---
    Patchwork: setting state on patchwork.kernel.org/linux-usb
     -> accepted : [v10,1/3] usb: typec: tcpci: move tcpci.h to include/linux/usb/
     -> accepted : [v10,2/3] dt-bindings: usb: Add analogix anx7411 PD binding
     -> accepted : [v10,3/3] usb: typec: anx7411: Add Analogix PD ANX7411 support
    ---
    You can now run:
      git send-email ./*.thanks

Note: it also works with "b4 ty -S" and won't do anything in --dry-run mode.

pw-discard-state: will be applied if you run "b4 ty -d". E.g.:

    $ b4 ty -d 24
    Discarding 1 messages
      Discarded: [PATCH] USB: serial: option: add Quectel EM05-G modem
    ---
    Patchwork: setting state on patchwork.kernel.org/linux-usb
     -> deferred : USB: serial: option: add Quectel EM05-G modem

You can also override the configured default state with the --pw-set-state
switch to "b4 ty", e.g.:

    $ b4 ty -d 24 --pw-set-state rejected
    Discarding 1 messages
      Discarded: [PATCH] USB: serial: option: add Quectel EM05-G modem
    ---
    Patchwork: setting state on patchwork.kernel.org/linux-usb
     -> rejected : USB: serial: option: add Quectel EM05-G modem


Please give it a whirl and report any explosions or wrongness.

-K
